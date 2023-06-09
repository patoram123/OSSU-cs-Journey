#lang racket/base
(require "racket-lexer.rkt"
         racket/contract
         "lexer-contract.rkt"
         racket/port)

(provide 
 (contract-out
  [scribble-inside-lexer lexer*/c]
  [scribble-lexer lexer*/c]
  [make-scribble-inside-lexer (->* () (#:command-char (and/c char? (not/c (or/c #\] #\[)))) lexer*/c)]
  [make-scribble-lexer (->* () (#:command-char (and/c char? (not/c (or/c #\] #\[)))) lexer*/c)]))

(define-struct text (scheme-rx end-rx sub-rx string-rx open-paren close-paren comment?) #:transparent)
(define-struct scheme (status backup mode comment?) #:transparent)
(define-struct args (comment?) #:transparent)
(define-struct text-args (comment?) #:transparent)

(define (comment-mode? mode)
  (define l (car mode))
  (cond
    [(text? l) (text-comment? l)]
    [(scheme? l) (scheme-comment? l)]
    [(args? l) (args-comment? l)]
    [(text-args? l) (text-args-comment? l)]
    [else #f]))

(define (maybe-comment type mode)
  (cond
    [(comment-mode? mode)
     (cond
       [(symbol? type)
        (hasheq 'type type 'comment? #t)]
       [else
        (hash-set type 'comment? #t)])]
    [else
     type]))

(define (make-rx:opener #:command-char [at #\@])
  (regexp (format "^[|]([^~aa-zA-Z0-9 \t\r\n\f\\\177-\377{]*){" (regexp-quote (string at)))))

(define rxes (make-weak-hash))
(define rx-keys (make-weak-hasheq))

(define (intern-byte-regexp bstr)
  (let ([v (hash-ref rxes bstr #f)])
    (or v
        (let ([rx (byte-regexp bstr)])
          (hash-set! rxes bstr rx)
          (hash-set! rx-keys rx (make-ephemeron rx bstr))
          rx))))

(define (make-scribble-inside-lexer #:command-char [at #\@])
  (define rx:opener (make-rx:opener #:command-char at))
  (define rx:^@ (regexp (format "^~a" (regexp-quote (string at)))))
  (define at-bytes (string->bytes/utf-8 (string at)))
  (define default-mode
    (list
     (make-text rx:^@
                #f
                #f
                (if (equal? at #\^)
                    #rx".*?(?:(?=[\r\n^])|$)"
                    (regexp (format ".*?(?:(?=[~a\r\n])|$)" at)))
                #f
                #f
                #f)))
  (define (scribble-inside-lexer orig-in offset orig-mode)
    (define mode (or orig-mode default-mode))
    (define in (special-filter-input-port
                orig-in
                (lambda (v s) (bytes-set! s 0 (char->integer #\.)) 1)))
    (let-values ([(line col pos) (port-next-location orig-in)])
      (when line
        (port-count-lines! in)))
    (let-values ([(line col pos) (port-next-location in)]
                 [(l) (car mode)])
      
      ;; If we don't match rx:opener in a place where we might otherwise
      ;;  match, and there is a "|" at that point, then a change later
      ;;  could turn the non-match into a match, AND there could be
      ;;  arbitrarily many Scheme tokens in between. So we carry the backup
      ;;  position, use it as necessary (from places that might be between a "|"
      ;;  and a potential match creator), and cancel it when it's clearly
      ;;  not needed anymore (which includes after any token that isn't a 
      ;;  Scheme token).
      (define (backup-if-needed pos)
        (if (and (scheme? (car mode))
                 (scheme-backup (car mode)))
            (- (+ pos offset) (scheme-backup (car mode)))
            0))
      (define (no-backup mode)
        (if (and (scheme? (car mode))
                 (scheme-backup (car mode)))
            (cons (struct-copy scheme (car mode) [backup #f])
                  (cdr mode))
            mode))
      (define (maybe-no-backup type mode)
        (if (eq? type 'white-space)
            ;; white space definitely ends the need for backup
            (no-backup mode)
            mode))
      
      (define (enter-@ comment-k)
        (cond
          [(equal? #\; (peek-char-or-special in))
           ;; Comment
           (read-char in)
           (if (or (equal? #\{ (peek-char-or-special in))
                   (equal? #\| (peek-char-or-special in)))
               ;; Bracketed comment:
               (let-values ([(end-line end-col end-pos) (port-next-location in)])
                 (comment-k (format "~a;" at)
                            (maybe-comment 'comment mode)
                            #f
                            pos
                            end-pos
                            (backup-if-needed pos)
                            (cons (make-text-args #t)
                                  (no-backup mode))))
               ;; Line comment:
               (begin
                 (regexp-match? #rx".*?(?=[\r\n])" in)
                 (let-values ([(end-line end-col end-pos) (port-next-location in)])
                   (comment-k (format "~a;" at)
                              (maybe-comment 'comment mode)
                              #f
                              pos
                              end-pos
                              (backup-if-needed pos)
                              (no-backup mode)))))]
          [(regexp-try-match rx:opener in)
           => (lambda (m) (enter-opener m mode mode))]
          [(regexp-try-match #rx"^{" in)
           (enter-simple-opener mode mode)]
          [else
           (let ([new-mode
                  (cond
                    [(equal? #\| (peek-char-or-special in))
                     (read-char in)
                     (list* (make-scheme 'bar (+ offset pos) #f (comment-mode? mode))
                            (no-backup mode))]
                    [else
                     (list* (make-scheme 'one #f #f (comment-mode? mode))
                            (make-args (comment-mode? mode))
                            (no-backup mode))])])
             (let-values ([(end-line end-col end-pos) (port-next-location in)])
               (values (string at)
                       (maybe-comment 'parenthesis mode)
                       #f
                       pos
                       end-pos
                       (backup-if-needed pos)
                       new-mode)))]))
      
      (define (enter-simple-opener mode c-mode)
        (let-values ([(end-line end-col end-pos) (port-next-location in)])
          (values "{"
                  (maybe-comment 'parenthesis c-mode)
                  '|{|
                  pos
                  end-pos
                  (backup-if-needed pos)
                  (cons (make-text rx:^@
                                   #rx"^}"
                                   #rx"^{"
                                   (if (equal? at #\^)
                                       #rx".*?(?:(?=[{}\r\n^])|$)"
                                       (regexp (format ".*?(?:(?=[~a{}\r\n])|$)" at)))
                                   '|{|
                                   '|}|
                                   (comment-mode? c-mode))
                        (no-backup mode)))))
      
      (define (enter-opener m mode c-mode)
        (let-values ([(end-line end-col end-pos) (port-next-location in)])
          (values (cadr m)
                  (maybe-comment 'parenthesis c-mode)
                  '|{| ;; Better complex paren?
                  pos
                  end-pos
                  (backup-if-needed pos)
                  (let ([closer (regexp-quote
                                 (bytes-append #"}"
                                               (flip (cadr m))
                                               #"|"))]
                        [re-opener (regexp-quote (cadr m))])
                    (define (byte-rx . args)
                      (intern-byte-regexp (apply bytes-append args)))
                    (cons (make-text (byte-rx #"^[|]" re-opener (regexp-quote at-bytes))
                                     (byte-rx #"^" closer)
                                     (byte-rx #"^[|]" re-opener #"{")
                                     (byte-rx #".*?(?:(?=[|]"
                                              re-opener
                                              #"(" (regexp-quote at-bytes) #"|{))|(?="
                                              closer
                                              #")|(?=[\r\n])|$)")
                                     '|{|  ;; Better complex paren?
                                     '|}|  ;; Better complex paren?
                                     (comment-mode? c-mode))
                          (no-backup mode))))))
      
      (if (eof-object? (peek-char-or-special in))
          (values eof
                  'eof
                  #f
                  pos 
                  pos
                  0
                  #f)
          (cond
            [(text? l)
             (cond
               [(and (text-scheme-rx l)
                     (regexp-try-match (text-scheme-rx l) in))
                ;; Found @
                (enter-@ values)]
               [(and (text-end-rx l)
                     (regexp-try-match (text-end-rx l) in))
                (let-values ([(end-line end-col end-pos) (port-next-location in)])
                  (values "}"
                          (maybe-comment 'parenthesis mode)
                          (text-close-paren l)
                          pos
                          end-pos
                          0
                          (cdr mode)))]
               [(and (text-sub-rx l)
                     (regexp-try-match (text-sub-rx l) in))
                (let-values ([(end-line end-col end-pos) (port-next-location in)])
                  (values "{"
                          (maybe-comment 'parenthesis mode)
                          (text-open-paren l)
                          pos
                          end-pos
                          0
                          (cons (car mode) mode)))]
               [(regexp-try-match #px"^(?:[\r\n])\\s*" in)
                ;; Treat a newline and leading whitespace in text mode as whitespace
                ;; instead of as a string:
                (let-values ([(end-line end-col end-pos) (port-next-location in)])
                  (values " "
                          (maybe-comment 'white-space mode)
                          #f
                          pos
                          end-pos
                          0
                          mode))]
               [else
                ;; Read string up to @, }, or newline
                (regexp-match? (text-string-rx l) in)
                (let-values ([(end-line end-col end-pos) (port-next-location in)])
                  (values 'text
                          (maybe-comment 'text mode)
                          #f
                          pos
                          end-pos
                          0
                          mode))])]
            [(scheme? l)
             (let ([status (scheme-status l)])
               (cond
                 [(and (eq? status 'bracket)
                       (regexp-try-match #px"^\\s*?[]]" in))
                  (let-values ([(end-line end-col end-pos) (port-next-location in)])
                    (values "]"
                            (maybe-comment 'parenthesis mode)
                            '|]|
                            pos
                            end-pos
                            0
                            (cdr mode)))]
                 [(and (memq status '(bar bar-no-more))
                       (regexp-try-match #px"^\\s*?[|]" in))
                  (let-values ([(end-line end-col end-pos) (port-next-location in)])
                    (values "|"
                            (maybe-comment 'parenthesis mode)
                            #f
                            pos
                            end-pos
                            (backup-if-needed pos)
                            (cdr mode)))]
                 [(regexp-try-match rx:^@ in)
                  ;; If we have a backup at this point, we can drop it, because
                  ;; edits after here cannot lead to a rx:opener match.
                  (enter-@ (lambda (lexeme type paren start end backup mode)
                             (values lexeme
                                     (if (eq? status 'one)
                                         'error
                                         type)
                                     paren
                                     start
                                     end
                                     backup
                                     mode)))]
                 [(and (eq? status 'one)
                       (regexp-try-match rx:opener in))
                  ;; Must have consumed a special before an opener
                  => (lambda (m) (enter-opener m (cdr mode) mode))]
                 [(and (eq? status 'one)
                       (regexp-try-match #rx"^{" in))
                  ;; Must have consumed a special before an opener
                  (enter-simple-opener (cdr mode) mode)]
                 [(and (eq? status 'one)
                       (regexp-try-match #rx"^#?['`]" in))
                  ;; Value special:
                  (let-values ([(end-line end-col end-pos) (port-next-location in)])
                    (values "'"
                            (maybe-comment 'constant mode)
                            #f
                            pos
                            end-pos
                            (backup-if-needed pos)
                            mode))]
                 [(and (eq? status 'one)
                       (regexp-try-match (regexp (format "^#?,~a?" (regexp-quote (string at)))) in))
                  ;; Other special:
                  (let-values ([(end-line end-col end-pos) (port-next-location in)])
                    (values ","
                            (maybe-comment 'other mode)
                            #f
                            pos
                            end-pos
                            (backup-if-needed pos)
                            mode))]
                 [else
                  (let*-values ([(lexeme type paren start end backup sub-mode adj)
                                 (case status
                                   [(bar bar-no-more one) (racket-nobar-lexer*/status in offset (scheme-mode l))]
                                   [else (racket-lexer*/status in offset (scheme-mode l))])]
                                [(l) (struct-copy scheme l [mode sub-mode])]
                                [(mode) (cons l (cdr mode))]
                                [(consume) (lambda (status)
                                             (case status
                                               [(many) mode]
                                               [(one) (cdr mode)]
                                               [(bracket bar-no-more) 
                                                (cons (struct-copy scheme l [status status])
                                                      (cdr mode))]
                                               [(bar) (cons (struct-copy scheme l [status 'bar-no-more])
                                                            (cdr mode))]
                                               [else (error "bad status" status)]))])                    
                    (values lexeme
                            (cond
                              [(or (eq? type 'comment) 
                                   (eq? type 'white-space))
                               (if (eq? status 'one)
                                   'error
                                   (maybe-comment type mode))]
                              [(eq? status 'bar-no-more) 
                               ;; Too many S-expressions in @| ... |
                               'error]
                              [else (maybe-comment type mode)])
                            paren 
                            start 
                            end
                            (backup-if-needed start)
                            (maybe-no-backup
                             type
                             (case adj
                               [(continue) mode]
                               [(datum) 
                                (cond
                                  [(pair? status) mode]
                                  [else (consume status)])]
                               [(open)
                                (cons (struct-copy scheme l [status (cons #t status)])
                                      (cdr mode))]
                               [(close)
                                (if (pair? status)
                                    (let ([v (cdr status)])
                                      (if (symbol? v)
                                          (consume v)
                                          (cons (struct-copy scheme l [status v])
                                                (cdr mode))))
                                    (consume status))]
                               [(bad) (if (pair? status)
                                          mode
                                          (consume status))]
                               [else (error "bad adj")]))))]))]
            [(args? l)
             (cond
               [(regexp-try-match #rx"^\\[" in)
                (let-values ([(end-line end-col end-pos) (port-next-location in)])
                  (values "["
                          (maybe-comment 'parenthesis mode)
                          '|[|
                          pos
                          end-pos
                          0
                          (list* (make-scheme 'bracket #f #f (comment-mode? mode))
                                 mode)))]
               [else
                (scribble-inside-lexer in offset (cons (make-text-args (comment-mode? mode))
                                                       (cdr mode)))])]
            [(text-args? l)
             (cond
               [(regexp-try-match rx:opener in)
                => (lambda (m) (enter-opener m (cdr mode) mode))]
               [(regexp-try-match #rx"^{" in)
                (enter-simple-opener (cdr mode) mode)]
               [else
                (scribble-inside-lexer in offset (cdr mode))])]
            [else (error "bad mode")]))))
  scribble-inside-lexer)

(define scribble-inside-lexer (make-scribble-inside-lexer))

(define (make-scribble-lexer #:command-char [at #\@])
  (define scribble-inside-lexer (make-scribble-inside-lexer #:command-char at))
  (define (scribble-lexer in offset mode)
    (scribble-inside-lexer in offset (or mode (list (make-scheme 'many #f #f #f)))))
  scribble-lexer)

(define scribble-lexer (make-scribble-lexer))

(define (flip s)
  (string->bytes/utf-8
   (list->string
    (reverse
     (for/list ([c (in-string (bytes->string/utf-8 s))])
       (cond
        [(equal? c #\() #\)]
        [(equal? c #\[) #\]]
        [(equal? c #\<) #\>]
        [(equal? c #\)) #\(]
        [(equal? c #\]) #\[]
        [(equal? c #\>) #\<]
        [else c]))))))
