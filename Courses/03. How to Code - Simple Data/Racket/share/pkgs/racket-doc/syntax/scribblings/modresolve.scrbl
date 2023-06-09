#lang scribble/doc
@(require "common.rkt" scribble/eval
          (for-label syntax/modresolve))

@(define (new-evaluator)
   (let* ([e (make-base-eval)])
     (e '(require (for-syntax racket/base) syntax/modresolve))
     e))

@(define evaluator (new-evaluator))

@title{Resolving Module Paths to File Paths}

@defmodule[syntax/modresolve]

@defproc[(resolve-module-path [module-path-v module-path?] 
                              [rel-to-path-v (or/c #f path-string? (-> any)) #f])
         (or/c path? symbol?
               (cons/c 'submod (cons/c (or/c path? symbol?) (listof symbol?))))]{

Resolves a module path to filename path. The module path is resolved
relative to @racket[rel-to-path-v] if it is a path string (assumed to
be for a file), to the directory result of calling the thunk if it is
a thunk, or to the current directory otherwise.

When @racket[module-path-v] refers to a module using a
collection-based path, resolution invokes the current @tech[#:doc
refman]{module name resolver}, but without loading the module even if it is not
@tech[#:doc refman]{declare}d. Beware that concurrent resolution in namespaces that share a
module registry can create race conditions when loading modules; see
also @racket[namespace-call-with-registry-lock].}


@defproc[(resolve-module-path-index [module-path-index module-path-index?] 
                                    [rel-to-path-v (or/c #f path-string? (-> any)) #f])
         (or/c path? symbol?
               (cons/c 'submod (cons/c (or/c path? symbol?) (listof symbol?))))]{

Like @racket[resolve-module-path] but the input is a @techlink[#:doc
refman]{module path index}; in this case, the @racket[rel-to-path-v]
base is used where the module path index contains the ``self'' index.
If @racket[module-path-index] depends on the ``self'' module path
index, then an exception is raised unless @racket[rel-to-path-v] is a
path string.

See @racket[module-path-index-resolve].

@examples[#:eval evaluator
          (resolve-module-path-index
           (module-path-index-join 'racket #f))
          (resolve-module-path-index
           (module-path-index-join "apple.rkt" #f))
          (resolve-module-path-index
           (module-path-index-join '(submod "." test) #f)
           (string->path "banana.rkt"))]
}