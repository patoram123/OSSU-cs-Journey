#lang racket/base

(require setup/dirs
         setup/cross-system
         racket/promise)

(provide variant-suffix
         script-variant?)

(define plain-variant
  (delay/sync
   (cond
     [(cross-installation?)
      (if (eq? 'chez-scheme (cross-system-type 'vm))
          'cs
          (cross-system-type 'gc))]
     [else
      (for/or ([dir (in-list (get-console-bin-search-dirs))])
        (define exe (cond [(eq? 'windows (system-type)) "Racket.exe"]
                          [(equal? #".dll" (system-type 'so-suffix))
                           ;; in cygwin so-suffix is ".dll"
                           "racket.exe"]
                          [else "racket"]))
        (define f (build-path dir exe))
        (and (file-exists? f)
             (with-input-from-file f
               (lambda ()
                 (define m (regexp-match #rx#"bINARy tYPe:e?..(.)"
                                         (current-input-port)))
                 (cond
                   [(not m) '3m]
                   [(equal? (cadr m) #"c") 'cgc]
                   [(equal? (cadr m) #"s") 'cs]
                   [else '3m])))))])))

(define (variant-suffix variant cased?)
  (let ([r (case variant
             [(3m script-3m)   (or (get-3m-suffix)
                                   (if (eq? '3m (force plain-variant)) "" "BC"))]
             [(cgc script-cgc) (or (get-cgc-suffix)
                                   (if (eq? 'cgc (force plain-variant)) "" "CGC"))]
             [(cs script-cs) (or (get-cs-suffix)
                                 (if (eq? 'cs (force plain-variant)) "" "CS"))]
             [else (error 'variant-suffix "unknown variant: ~e" variant)])])
    (if cased? r (string-downcase r))))

(define (script-variant? v)
  (memq v '(script-3m script-cgc script-cs)))
