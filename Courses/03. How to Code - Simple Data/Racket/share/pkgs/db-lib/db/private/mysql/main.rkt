#lang racket/base
(require racket/class
         racket/tcp
         openssl
         db/private/generic/interfaces
         db/private/generic/common
         racket/unix-socket
         "connection.rkt")
(provide mysql-connect
         mysql-guess-socket-path
         mysql-password-hash)

(define (mysql-connect #:user user
                       #:database [database #f]
                       #:password [password #f]
                       #:server [server #f]
                       #:port [port #f]
                       #:socket [socket #f]
                       #:allow-cleartext-password? [allow-cleartext-password? 'local]
                       #:ssl [ssl 'no]
                       #:ssl-context [ssl-context
                                      (case ssl
                                        ((no) #f)
                                        (else (ssl-make-client-context)))]
                       #:notice-handler [notice-handler void]
                       #:debug? [debug? #f])
  (let ([connection-options
         (+ (if (or server port) 1 0)
            (if socket 1 0))])
    (when (> connection-options 1)
      (error 'mysql-connect "cannot give both server/port and socket arguments")))
  (let* ([notice-handler
          (cond [(procedure? notice-handler) notice-handler]
                [else (make-print-notice notice-handler)])]
         [c (new connection%
                 (notice-handler notice-handler)
                 (custodian-b (make-custodian-box (current-custodian) #t)))])
    (when debug? (send c debug #t))
    (with-handlers
       ([exn? (lambda (e)
                (send c disconnect* #f)
                (raise e))])
      (define transport
        (cond [socket
               (let ([socket (if (eq? socket 'guess)
                                 (mysql-guess-socket-path)
                                 socket)])
                 (let-values ([(in out) (unix-socket-connect socket)])
                   (send c attach-to-ports in out)))
               'socket]
              [else
               (let ([server (or server "localhost")]
                     [port (or port 3306)])
                 (let-values ([(in out) (tcp-connect server port)])
                   (send c attach-to-ports in out)))
               'tcp]))
      (send c start-connection-protocol database user password transport ssl ssl-context
            (and (not socket) (or server "localhost")) allow-cleartext-password?))
    c))

;; make-print-notification : output-port -> number string -> void
(define ((make-print-notice out) code condition)
  (fprintf (case out
             ((output) (current-output-port))
             ((error) (current-error-port))
             (else out))
           "notice: ~a (MySQL code ~a)\n" condition code))

(define socket-paths
  (case (system-type)
    ((unix) '("/var/run/mysqld/mysqld.sock"))
    (else '())))

(define (mysql-guess-socket-path)
  (guess-socket-path/paths 'mysql-guess-socket-path socket-paths))
