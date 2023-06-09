#lang racket/base

(require "../utils/utils.rkt"
         racket/match racket/list
         (for-syntax racket/base syntax/parse)
         (contract-req)
         "../rep/type-rep.rkt"
         "../rep/prop-rep.rkt"
         "../rep/object-rep.rkt"
         "../rep/rep-utils.rkt"
         "../utils/tc-utils.rkt"
         racket/set
         "../types/tc-result.rkt"
         "../types/resolve.rkt"
         "../types/update.rkt"
         "../types/prop-ops.rkt"
         "../types/subtract.rkt"
         "../types/path-type.rkt"
         "../env/type-env-structs.rkt"
         "../env/lexical-env.rkt"
         "../env/mvar-env.rkt"
         (only-in "../infer/infer.rkt" intersect)
         (rename-in "../types/abbrev.rkt"
                    [-> -->]
                    [->* -->*]
                    [one-of/c -one-of/c])
         "tc-metafunctions.rkt"
         "tc-subst.rkt")

(provide with-lexical-env+props
         with-lexical-env+props-simple
         implies-in-env?
         env+)

(define (implies-in-env? env p1 p2)
  (not (env+ env (list p1 (negate-prop p2)))))

;; Returns #f if anything becomes (U)
(define (env+ env ps)
  (cond
    [(or (null? ps) (andmap TrueProp? ps)) env]
    [else
     (define-values (props atoms^) (combine-props ps (env-props env)))

     (define atoms (if atoms^
                        ;; fix the order of paths to the same object.
                        ;; move objects with fewer path elements forward.
                        (sort atoms^ (lambda (x y)
                                       (match* (x y)
                                         [((TypeProp: (Path: pes1 (? identifier? var1)) _)
                                           (TypeProp: (Path: pes2 (? identifier? var2)) _))
                                          #:when (equal? var1 var2)
                                          (and (< (length pes1) (length pes2)))]
                                         [(_ _) #f])))
                        atoms^))
     (cond
       [props
        (let loop ([todo atoms]
                   [atoms '()]
                   [negs '()]
                   [new '()]
                   [Γ (env-replace-props env props)])
          (match todo
            [(cons p ps)
             ;; update-obj-pos-type : (listof Prop?) env? Object? Type? -> env or #f
             ;; sometimes we need to update the object's type directly -- this helper
             ;; does that and continues looping
             (define (update-obj-pos-type new Γ obj pt)
               (let ([t (lookup-obj-type/lexical obj Γ #:fail (λ (_) Univ))])
                 (define new-t (intersect t pt obj))
                 (cond
                   [(Bottom? new-t) #f]
                   [(equal? t new-t) (loop ps (cons p atoms) negs new Γ)]
                   [else
                    ;; it's a new type! check if there are any logical propositions that can
                    ;; be extracted from new-t
                    (define-values (new-t* new-props) (extract-props obj new-t))
                    (loop ps
                          (cons (-is-type obj new-t*) atoms)
                          negs
                          (append new-props new)
                          (env-set-obj-type Γ obj new-t*))])))
             (match p
               [(TypeProp: (and obj (Path: pes (? identifier? x))) pt)
                (let ([t (lookup-id-type/lexical x Γ #:fail (λ (_) Univ))])
                  (define new-t (update t pt #t pes))
                  (cond
                    [(Bottom? new-t) #f]
                    [(equal? t new-t)
                     (cond
                       [(ormap uninterpreted-PE? pes)
                        (update-obj-pos-type new Γ obj pt)]
                       [else (loop ps (cons p atoms) negs new Γ)])]
                    [else
                     ;; it's a new type! check if there are any logical propositions that can
                     ;; be extracted from new-t
                     (define-values (new-t* new-props) (extract-props (-id-path x) new-t))
                     (cond
                       ;; if the path contains an uninterpreted path element,
                       ;; we need to update the object's type in addition to
                       ;; the identifier's type
                       [(ormap uninterpreted-PE? pes)
                        (update-obj-pos-type (append new-props new)
                                             (env-set-id-type Γ x new-t*)
                                             obj
                                             pt)]
                       [(path-type pes new-t*) => (lambda (pt)
                                                    (loop ps
                                                          (cons (-is-type obj pt) atoms)
                                                          negs
                                                          (append new-props new)
                                                          (env-set-id-type Γ x new-t*)))]
                       [else #f])]))]
               [(TypeProp: obj pt)
                (update-obj-pos-type new Γ obj pt)]
               ;; process negative info _after_ positive info so we don't miss anything!
               ;; (overly simple example: if we started with x ∈ Any, updating it's type in Γ
               ;; with x ∉ String and then x ∈ String just produces a Γ with x ∈ String,
               ;; but updating with x ∈ String _and then_ x ∉ String derives a contradiction)
               [(? NotTypeProp?)
                (loop ps atoms (cons p negs) new Γ)]
               [_ (loop ps atoms negs new Γ)])]
            [_ (let loop ([negs negs]
                          [atoms atoms]
                          [new new]
                          [Γ Γ])
                 (match negs
                   [(cons p negs)
                    ;; update-obj-neg-type : (listof Prop?) env? Object? Type? -> env or #f
                    ;; sometimes we need to update the object's type directly -- this helper
                    ;; does that and continues looping
                    (define (update-obj-neg-type new Γ obj pt)
                      (let ([t (lookup-obj-type/lexical obj Γ #:fail (λ (_) Univ))])
                        (define new-t (subtract t pt))
                        (cond
                          [(Bottom? new-t) #f]
                          [(equal? t new-t) (loop negs (cons p atoms) new Γ)]
                          [else
                           ;; it's a new type! check if there are any logical propositions that can
                           ;; be extracted from new-t
                           (define-values (new-t* new-props) (extract-props obj new-t))
                           (loop negs
                                 (cons (-is-type obj new-t*) atoms)
                                 (append new-props new)
                                 (env-set-obj-type Γ obj new-t*))])))
                    (match p
                      [(NotTypeProp: (and obj (Path: pes (? identifier? x))) pt)
                       (let ([t (lookup-id-type/lexical x Γ #:fail (λ (_) Univ))])
                         (define new-t (update t pt #f pes))
                         (cond
                           [(Bottom? new-t) #f]
                           [(equal? t new-t)
                            (cond
                              [(ormap uninterpreted-PE? pes)
                               (update-obj-neg-type new Γ obj pt)]
                              [else (loop negs (cons p atoms) new Γ)])]
                           [else
                            ;; it's a new type! check if there are any logical propositions that can
                            ;; be extracted from new-t
                            (define-values (new-t* new-props) (extract-props (-id-path x) new-t))
                            (cond
                              ;; if the path contains an uninterpreted path element,
                              ;; we need to update the object's type in addition to
                              ;; the identifier's type
                              [(ormap uninterpreted-PE? pes)
                               (update-obj-neg-type (append new-props new)
                                                    (env-set-id-type Γ x new-t*)
                                                    obj
                                                    pt)]
                              [else
                               (loop negs
                                     (cons p atoms)
                                     (append new-props new)
                                     (env-set-id-type Γ x new-t*))])]))]
                      [(NotTypeProp: obj pt)
                       (update-obj-neg-type new Γ obj pt)])]
                   [_
                    (cond
                      ;; there was a contradiction, return #f
                      [(not Γ) #f]
                      ;; we're done updating types and nothing additional appeared, return the new Γ
                      [(null? new) (env-replace-props Γ (append atoms (env-props Γ)))]
                      ;; Q: What if 'new' is not null?
                      ;; A: as we're updating types, it's possible a new type had some refinements in it
                      ;; that we have now extracted. For example, say we updated x's type from
                      ;; (U String (Refine [n : Int] (<= n 42)))
                      ;; to
                      ;; (Refine [n : Int] (<= n 42))
                      ;; now we _know_ not only that x has a more specific type, we know the logical
                      ;; proposition (<= x 42).
                      ;; So in cases like this where we have a new type and 'extract-props' found
                      ;; something, we go back and logically add those extracted props to the environment
                      ;; in case it further refines our logical view of the program.
                      [else (env+ (env-replace-props Γ (append atoms (env-props Γ))) new)])]))]))]
       [else #f])]))


;; run code in an extended env and with replaced props.
;; Requires the body to return a tc-results.
;; WARNING: this may bail out when code is unreachable
(define-syntax (with-lexical-env+props stx)
  (define-splicing-syntax-class unreachable?
    (pattern (~seq #:unreachable form:expr))
    (pattern (~seq) #:with form #'(begin)))
  (syntax-parse stx
    [(_ ps:expr
        #:expected expected
        u:unreachable? . b)
     (syntax/loc stx
       (let ([old-props (env-props (lexical-env))]
             [new-env (env+ (lexical-env) ps)])
         (cond
           [new-env
            (with-lexical-env
              new-env
              (let ([result (let () . b)])
                (match expected
                  ;; if there was not any expected results, then
                  ;; return any new info that was learned while
                  ;; extending the environment
                  [(or #f (tc-any-results: #f))
                   (define new-props
                     (make-AndProp (set-subtract (env-props new-env) old-props)))
                   (add-unconditional-prop result new-props)]
                  ;; otherwise, just return the expected results
                  [_ (fix-results expected)])))]
           [else
            ;; unreachable, bail out
            u.form
            (ret -Bottom)])))]))

(define-syntax (with-lexical-env+props-simple stx)
  (syntax-parse stx
    [(_ ps:expr #:absurd absurd:expr . b)
     (syntax/loc stx
       (let ([old-props (env-props (lexical-env))]
             [new-env (env+ (lexical-env) ps)])
         (cond
           [new-env
            (with-lexical-env
                new-env
              (let () . b))]
           [else absurd])))]))
