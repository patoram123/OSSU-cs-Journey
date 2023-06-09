#lang scribble/doc
@(require scribble/manual
          "rkt-exports.rkt"
          "plai-exports.rkt"
          "lang-names.rkt"
          (for-syntax scheme)
          (for-label (except-in scheme
                                error printf)
                     (prefix-in scheme:
                                scheme)
                     (only-in plai/main
                              type-case define-type error
                              test test/pred test/exn test/regexp
                              equal~?
                              abridged-test-output
                              plai-catch-test-exn
                              halt-on-errors print-only-errors
                              test-inexact-epsilon plai-ignore-exn-strings
                              plai-all-test-results)
                     (only-in plai/collector
                              root?
                              heap-size
                              location?
                              heap-value?
                              heap-set! heap-ref with-heap
                              get-root-set read-root set-root!
                              procedure-roots)
                     plai/scribblings/fake-collector
                     plai/scribblings/fake-mutator
                     plai/scribblings/fake-web
                     plai/random-mutator
                     (only-in plai/web
                              no-web-browser
                              static-files-path)
                     (only-in plai/mutator
                              set-first!
                              set-rest!
                              import-primitives
                              test/location=?
                              test/value=?
                              printf)))

@title{@italic{Programming Languages: Application and Interpretation}}

This is the documentation for the software accompanying the textbook @bold{Programming Languages: Application and
Interpretation} (PLAI). The full book can be found on the Web at:

@(link "http://www.cs.brown.edu/~sk/Publications/Books/ProgLangs/"
       "http://www.cs.brown.edu/~sk/Publications/Books/ProgLangs/")

This package contains the following languages:

@local-table-of-contents[#:style 'immediate-only]

@section[#:tag "plai-scheme"]{@PLAI-LANG} 

@defmodulelang[plai]

@(define scheme-guide '(lib "scribblings/reference/reference.scrbl"))

@PLAI-LANG is derived from the @racketmodname[scheme] language.  In addition,
it includes the @racket[define-type] and @racket[type-case] forms and testing
support. Also, modules written in @racketmodname[plai] export every definition
(unlike @racketmodname[scheme]).

@subsection[#:tag "define-type"]{Defining Types: @racket[define-type]}

@defform*/subs[[(define-type type-id variant ...)
                (define-type type-id #:immutable variant ...)]
              ([variant (variant-id (field-id contract-expr) ...)])]{

Defines the datatype @racket[_type-id].  A constructor @racket[_variant-id] is
defined for each variant.  Each constructor takes an argument for each field of
its variant.

The value of each field is checked by its associated @racket[_contract-expr].
A @racket[_contract-expr] may be an arbitrary predicate or a contract.

If the @racket[#:immutable] option is provided, the constructors create
immutable structs. Otherwise, they can be mutated.

In addition to the constructors, a @racket[define-type] expression also defines:

@itemize[

  @item{a predicate @racket[_type-id?] that returns @racket[true] for instances
    of the datatype, and @racket[false] for any other value,}

  @item{for each variant, a predicate @racket[_variant-id?] that returns
    @racket[true] when applied to a value of the same variant and
    @racket[false] for any other value,}

  @item{for each field of each variant, an accessor
    @racket[_variant-id-field-id] that returns the value of the field, and}

  @item{unless the @racket[#:immutable] option is provided, for each field of
    each variant, @racket[define-type] also defines a mutator
    @racket[_set-variant-id-field-id!] that sets the value of the field.}
]}

@subsection[#:tag "type-case"]{Deconstructing Data Structures: @racket[type-case]}

@defform/subs[(type-case datatype-id expr
                 branch ...)

              ([branch (variant-id (field-id ...) result-expr ...)
                       (else result-expr ...)])]{

Branches on the datatype instance produced by @racket[_expr], which must be an
instance of @racket[_datatype-id] (previously defined with
@racket[define-type]) Each @racket[_branch] extracts the values of the fields,
and binds them to @racket[_field-id ...].

If a branch is not specified for each variant, you may use an @racket[else]
branch to create a catch-all branch.  An @racket[else] branch must be the last
branch in the sequence of branches.  @racket[type-case] signals a compile-time
error if all variants are not covered and the @racket[else] branch is missing.
Similarly, @racket[type-case] signals a compile-time error if an @racket[else]
branch is unreachable because a branch exists for all variants.

}

@subsection[#:tag "testing"]{Testing Infrastructure}

PLAI Scheme provides the following syntactic forms for testing.

@defform/subs[(test result-expr expected-expr)()]{

If @racket[_result-expr] and @racket[_expected-expr] evaluate to the same
value @racket[_result-value] according to @racket[equal~?], the test prints the following expression:

@racketresultfont{(good result-expr result-value expected-value location)}.

If they do not evaluate to the same value, the test prints

@racketresultfont{(bad result-expr result-value expected-value location)}.

If evaluating @racket[_result-expr] signals an error, the test prints

@racketresultfont{(exception result-expr exception-message <no-expected-value> location)}

If evaluating @racket[_expected-expr] signals an error, the test prints

@racketresultfont{(pred-exception result-expr exception-message <no-expected-value> location)}

If the printout begins with @racket[good], then it is printed to
@racket[(current-output-port)]; otherwise it is printed to @racket[(current-error-port)].

}

@defform/subs[(test/pred result-expr pred?)()]{

Similar to @racket[test], but instead of supplying an expected value, the
predicate @racket[_pred?] is applied to @racket[_result-expr].

If evaluating @racket[_pred?] signals an error, the test prints

@racketresultfont{(pred-exception result-expr exception-message <no-expected-value> location)}

The syntax of @racket[_pred?] is considered @racket[_expected-value] for the
purposes of test reporting.
}

@defthing[error procedure?]{
 Like @racketmodname[scheme]'s @racket[scheme:error],
 but generates exceptions that are caught by @racket[test/exn].
}

@defform/subs[(test/exn result-expr error-message)()]{

This test succeeds if the expression evaluates to a call to
@racket[error]. Moreover, the error message contained in the exception must
contain the string @racket[_error-message]. Note that @racket[test/exn] only
succeeds if the exception was explicitly raised by the user.

For example, the following test succeeds:

@racketblock[(test/exn (error "/: division by zero") "by zero")]

The error message is @racket["/: division by zero"], and @racket["by zero"] is
a substring of the error message. However, the following test fails:

@racketblock[(test/exn (/ 25 0) "by zero")]

Although the expression raises an exception and the error string contains
@racket["by zero"], since the error was not explicitly raised by user-written
code, the test fails.

The evaluation of @racket[_error-message] is considered
@racket[_expected-value] for the purposes of test reporting.
}

@defform/subs[(test/regexp result-expr error-message-regexp)()]{

This test is similar to @racket[test/exn],but the error message is matched
against a regular expression instead.

The evaluation of @racket[_error-message-regexp] is considered
@racket[_expected-value] for the purposes of test reporting.
}


@subsubsection{Test Equality}

@defproc[(equal~? [v1 any/c] [v2 any/c]) boolean?]{

The same as @racket[equal?], except that if @racket[v1] and
@racket[v2] are real numbers, and if either is inexact, then the result
is @racket[#t] if the difference between the number is
less than @racket[(test-inexact-epsilon)].}


@subsubsection{Test Flags}

@defproc[(abridged-test-output (abridge? boolean? false)) void?]{

When this flag is set to @racket[true], the test forms never prints
@racket[_result-expr] or @racket[_location].

}

@defproc[(plai-catch-test-exn (catch? boolean? true)) void?]{

When this flag is set to @racket[true], exceptions from tests will be caught.
By default, exceptions are caught.

}


@defproc[(halt-on-errors (halt? boolean? true)) void?]{

This flag determines whether the program immediately halts when a test fails.
By default, programs do not halt on failures.
}

@defproc[(print-only-errors (print? boolean? true)) void?]{

When this flag is set to @racket[true], only tests that fail will be printed.
By default, the results of all tests are printed.

}

@defproc[(test-inexact-epsilon (epsilon number?)) void?]{

When testing immediate inexact values for equality, @racket[test] permits them to differ
by @racket[_epsilon].  The default value of @racket[_epsilon] is @racket[0.01].

}

@defproc[(plai-ignore-exn-strings (ignore? boolean?)) void?]{

If this flag is set to @racket[true], when testing for exceptions with
@racket[test/exn] and @racket[test/regexp], the message of the exception is
ignored.  By default, @racket[test/exn] and @racket[test/regexp] only succeed
when the message of the exception matches the supplied string or regular
expression.

}

@defidform[plai-all-test-results]{

This variable is the list of all tests that have been run so far, with the most
recent test at the head.

}
@include-section["collector.scrbl"]
@include-section["mutator.scrbl"]
@include-section["collector2.scrbl"]
@include-section["mutator2.scrbl"]

@section{Generating Random Mutators}

@defmodule[plai/random-mutator]

This PLAI library provides a facility for generating random mutators,
in order to test your garbage collection implementation.

@defproc[(save-random-mutator
          [file path-string?]
          [collector-name string?]
          [#:heap-values heap-values (cons heap-value? (listof heap-value?))
                                     (list 0 1 -1 'x 'y #f #t '())]
          [#:iterations iterations exact-positive-integer? 200]
          [#:program-size program-size exact-positive-integer? 10]
          [#:heap-size heap-size exact-positive-integer? 100]
          [#:gc2? gc2? boolean? #f])
         void?]{
Creates a random mutator that uses the collector @racket[collector-name] and
saves it in @racket[file].

The mutator is created by first making a random graph whose nodes either have
no outgoing edges, two outgoing edges, or some random number of outgoing edges
and then picking a random path in the graph that ends at one of the nodes with
no edges.

This graph and path are then turned into a PLAI program by creating a
@racket[let] expression that binds one variable per node in the graph.  If the
node has no outgoing edges, it is bound to a @racket[heap-value?].  If the node
has two outgoing edges, it is bound to a pair and the two edges are put into
the first and rest fields. Otherwise, the node is represented as a procedure
that accepts an integer index and returns the destination node of the
corresponding edge.

Once the @racket[let] expression has been created, the program creates a bunch
of garbage and then traverses the graph, according to the randomly created
path. If the result of the path is the expected heap value, the program does
this again, up to @racket[iterations] times. If the result of the path is not
the expected heap value, the program terminates with an error.

The keyword arguments control some aspects of the generation
of random mutators:
@itemize[
@item{Elements from the @racket[heap-values] argument are used as the base
  values when creating nodes with no outgoing edges.  See also
  @racket[find-heap-values].}
@item{The @racket[iterations] argument controls how many times the graph is
  created (and traversed).}
@item{The @racket[program-size] argument is a bound on how big the program it
  is; it limits the number of nodes, the maximum number of edges, and the
  length of the path in the graph.}
@item{The @racket[heap-size] argument controls the size of the heap in the
  generated mutator.}]

}

Example:
@racketblock[(save-random-mutator "tmp.rkt" "mygc.rkt" #:gc2? #t)]
will write to @filepath{tmp.rkt} with a program like this one:
@codeblock{
#lang plai/gc2/mutator
(allocator-setup "mygc.rkt" 200)
(define (build-one)
  (let* ((x0 1)
         (x1 (cons #f #f))
         (x2
          (lambda (x)
            (if (= x 0)
              x0
              (if (= x 1) x0 (if (= x 2) x1 (if (= x 3) x1 x0))))))
         (x3 1)
         (x4 (cons x3 x3))
         (x5 (lambda (x) (if (= x 0) x4 (if (= x 1) x1 x2)))))
    (set-first! x1 x2)
    (set-rest! x1 x3)
    x5))
(define (traverse-one x5) (= 1 (first (x5 0))))
(define (trigger-gc n)
  (if (zero? n) 0 (begin (cons n n) (trigger-gc (- n 1)))))
(define (loop i)
  (if (zero? i)
    'passed
    (let ((obj (build-one)))
      (trigger-gc 200)
      (if (traverse-one obj) (loop (- i 1)) 'failed))))
(loop 200)
}


@defproc[(find-heap-values [input (or/c path-string? input-port?)])
         (listof heap-value?)]{
  Processes @racket[input] looking for occurrences of @racket[heap-value?]s in
  the source of the program and returns them. This makes a good start for the
  @racket[_heap-values] argument to @racket[save-random-mutator].

  If @racket[input] is a port, its contents are assumed to be a well-formed
  PLAI program. If @racket[input] is a file, the contents of the file are used.
}


@section[#:tag "web"]{@WEB-LANG}

@defmodulelang[plai/web]

The @WEB-LANG language allows you to write server-side Web applications for the
PLT Web Server.

For more information about writing Web applications, see:
@other-manual['(lib "web-server/scribblings/web-server.scrbl")].

When you click on the @onscreen{Run} button in DrRacket, your Web application
is launched in the Web server.

The application is available at
@italic{http://localhost:8000/servlets/standalone.rkt}.

The @WEB-LANG language will automatically load this URL in your Web browser.

You may use @racket[no-web-browser] to prevent the browser from being launched
and @racket[static-files-path] to serve additional static files.

@subsection{Web Application Exports}

@declare-exporting[#:use-sources (plai/scribblings/fake-web)]

A Web application must define a procedure @racket[start]:

@defproc[(start (initial-request request?)) response?]{

The initial request to a Web application is serviced by this procedure.

}
