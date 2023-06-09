#lang scribble/doc
@(require scribble/manual
          (for-label racket/base racket/contract openssl
                     sasl sasl/saslprep sasl/plain sasl/scram sasl/cram-md5))

@title{SASL: Simple Authentication and Security Layer}
@author[@author+email["Ryan Culpepper" "ryanc@racket-lang.org"]]

This library provides implementations of some
@hyperlink["https://tools.ietf.org/html/rfc4422"]{SASL (RFC 4422)} mechanisms.
Currently only client support is implemented; future versions of this library
may add server support.

@; ----------------------------------------
@section[#:tag "sasl-intro"]{SASL Introduction}

This library implements non-trivial (multi-message) authentication mechanisms
using @deftech{SASL protocol contexts}.  Since in general SASL is embedded as a
sub-protocol of some application protocol, this library does not handle I/O
directly. Instead, the user is responsible for transferring messages between
the SASL context and the application protocol.

Note that some SASL authentication mechanisms leave the communication of
authentication success or failure to the application layer. Even when a
mechanism normally communicates the result of authentication, some applications
choose to convey failure at the application layer.

The following is a sketch of a typical embedding of SASL in an application
protocol:
@itemlist[#:style 'ordered
@item{server → client: ... Hello. I understand the following SASL mechanisms:
                       @tt{SCRAM-SHA-1} and @tt{CRAM-MD5}}
@item{client → server: I choose @tt{SCRAM-SHA-1}. My initial SASL message is ``@emph{<initial @tt{SCRAM-SHA-1} message>}''.}
@item{server → client: My SASL response is ``@emph{<@tt{SCRAM-SHA-1} response>}''.}
@item{client → server: My final SASL message is ``@emph{final <@tt{SCRAM-SHA-1} message>}''.}
@item{server → client: My final SASL response is ``@emph{<final @tt{SCRAM-SHA-1} response>}''.}
@item{client → server: Great! Let's get to work....}
]
In particular, the application layer advertises and selects SASL mechanisms,
embeds SASL messages using some application-specific framing, and resumes after
authentication is complete.


@; ----------------------------------------
@section[#:tag "sasl"]{SASL Protocol Contexts}
@defmodule[sasl]

@defproc[(sasl-ctx? [v any/c]) boolean?]{

Returns @racket[#t] if @racket[v] is a @tech{SASL protocol context}, @racket[#f]
otherwise.
}

@defproc[(make-sasl-ctx [aux any/c]
                        [out (or/c #f bytes? string?)]
                        [next sasl-next/c]) sasl-ctx?]{
  Returns a custom SASL protocol context.  Use this procedure when you
  need to implement a SASL mechanism that is not directly supported by
  this library.

  The @racket[aux] argument is an implementation-dependent value that
  is passed in calls to the context's transition procedures.

  The @racket[out] argument provides the initial outgoing message to
  be sent.  If its value is @racket[#f], then the state of the context
  is one in which it does not send an initial message.  Otherwise, the
  state of the context is @racket['send/receive] or
  @racket['send/done], depending on the value of @racket[next].

  The @racket[next] argument transitions the context into the next
  state when a message is received.  If its value is @racket['done],
  the context is transitioned into a state where it may not receive
  new messages.  If its value is a procedure, then the next time a
  message is received, that procedure will be called with @racket[aux]
  and the received message as arguments.  Its two return values will
  be used as the value of the next outgoing message, and the next
  transition procedure, respectively.

  When @racket[next] raises an exception, the context is automatically
  transitioned into the @racket['error] state and an
  @racket[exn:fail:sasl:fatal?] exception is raised.

  @history[#:added "1.3"]
}

@defproc[(sasl-next-message [ctx sasl-ctx?])
         (or/c string? bytes?)]{

Returns the next outgoing message to be sent. Subsequent calls to
@racket[sasl-next-message] return the same message until the outgoing message is
updated after a call to @racket[sasl-receive-message].

This function may be called only when @racket[(sasl-state ctx)] is
@racket['send/receive] or @racket['send/done]; otherwise, an exception is
raised.
}

@defproc[(sasl-receive-message [ctx sasl-ctx?] [message (or/c string? bytes?)])
         void?]{

Update the SASL context with a newly received @racket[message].

If @racket[message] represents progress or success, then @racket[ctx] is updated
and subseqent calls to @racket[sasl-next-message] return a new message (or fail,
if the protocol is done).

If @racket[message] indicates authentication failure or if @racket[message] is
ill-formed or invalid, an exception is raised and @racket[ctx] enters a permanent
error state (see @racket[sasl-state]).  The user must take appropriate action
after either kind of failure. For example, upon authentication failure the
client might close the connection and try again with different credentials.

This function may be called only when @racket[(sasl-state ctx)] is
@racket['receive] or @racket['send/receive]; otherwise, an exception is raised.
}

@defproc[(sasl-state [ctx sasl-ctx?])
         (or/c 'receive 'send/receive 'send/done 'done 'error)]{

Returns a symbol indicating the state that @racket[ctx] is in with respect to
its protocol. The number of states is due to the following factors: the initial
SASL message may be sent from the client or the server (depending on the
mechanism); the final SASL message mey be sent from the client or the server
(depending on the mechanism); and the SASL context doesn't know whether an
outgoing message has been forwarded to the application layer and sent.

The possible states consist of the following:
@itemlist[
@item{@racket['receive]: the protocol starts with @racket[ctx] receiving a
message}
@item{@racket['send/receive]: send the current outgoing message
(@racket[sasl-next-message]) if it hasn't already been sent, then receive}
@item{@racket['send/done]: send the current outgoing message
(@racket[sasl-next-message]) if it hasn't already been sent, then the SASL
protocol is done}
@item{@racket['done]: the SASL protocol ended with the last received message}
@item{@racket['error]: a fatal error occurred}
]
}

@defthing[
  #:kind "contract"
  sasl-next/c contract?
  #:value (or/c 'done
                (-> any/c
                    (or/c bytes? string?)
                    (values (or/c #f bytes? string?) sasl-next/c)))
]{
  The contract for custom SASL mechanism state transition procedures.
}

@defstruct[(exn:fail:sasl:fatal exn:fail)
           ([msg string?])]{

  The exception that is raised by SASL contexts when a fatal error
  occurs.
}


@; ----------------------------------------
@section[#:tag "saslprep"]{SASLprep}
@defmodule[sasl/saslprep]

@defproc[(saslprep [s string?]
                   [#:allow-unassigned? allow-unassigned? boolean? #f])
         string?]{

Implements the @hyperlink["https://tools.ietf.org/html/rfc4013"]{SASLprep (RFC 4013)}
algorithm for preparing user names and passwords for comparison, hashing, etc.

In general, the mechanism implementations in this library call @racket[saslprep]
on their arguments when appropriate.
}

@; ----------------------------------------
@section[#:tag "sasl-scram"]{@tt{SCRAM} Authentication}
@defmodule[sasl/scram]

This module implements the @hyperlink["https://tools.ietf.org/html/rfc5802"]{@tt{SCRAM}}
family of authentication mechanisms, namely
@as-index{@hyperlink["https://tools.ietf.org/html/rfc5802"]{@tt{SCRAM-SHA-1}
and @tt{SCRAM-SHA-1-PLUS}}},
@as-index{@hyperlink["https://tools.ietf.org/html/rfc7677"]{@tt{SCRAM-SHA-256}
and @tt{SCRAM-SHA-256-PLUS}}} and
@as-index{@hyperlink["https://datatracker.ietf.org/doc/html/draft-melnikov-scram-sha-512-02"]{@tt{SCRAM-SHA-512}
and @tt{SCRAM-SHA-512-PLUS}}}.

The @tt{SCRAM} protocol family has the following structure:
@itemlist[#:style 'ordered
@item{client → server: initial message with nonce prefix}
@item{server → client: reply with complete nonce and PBKDF2 salt and iteration count}
@item{client → server: client signature}
@item{server → client: authentication result and server signature}
]
In particular: the client sends the first message; authentication success or
failure is conveyed at in SASL protocol layer; and the server authenticates
itself to the client. Messages are represented as strings.

@defproc[(make-scram-client-ctx [digest (or/c 'sha1 'sha256 'sha512)]
                                [authentication-id string?]
                                [password string?]
                                [#:authorization-id authorization-id (or/c string? #f) #f]
                                [#:channel-binding channel-binding
                                                   (or/c #f #t (list/c symbol? bytes?))
                                                   #f])
         sasl-ctx?]{

Creates a @tt{SCRAM} protocol context. The @racket[digest] argument
selects between @tt{SCRAM-SHA-1}, @tt{SCRAM-SHA-256} and
@tt{SCRAM-SHA-512}, respectively. The @racket[authentication-id],
@racket[password], and (if provided) @racket[authorization-id]
arguments are automatically processed using @racket[saslprep].

The @racket[channel-binding] argument must have the form @racket[(list
_cb-type _cb-data)] if the server offered and the client selected a
mechanism with channel binding, indicated with a @tt{-PLUS} suffix,
such as @tt{SCRAM-SHA-1-PLUS}. The @racket[_cb-type] must be a symbol
naming a channel binding type, such as @racket['tls-unique], and
@racket[_cb-data] must be a byte string containing the corresponding
data. The available channel binding types depend on the application
and the channel. For example, one common type of channel is TLS; use
@racket[ssl-channel-binding] to get channel binding data for a TLS
connection. The @racket[channel-binding] argument should be
@racket[#t] if the client supports channel binding but the server did
not offer a @tt{PLUS} option. The @racket[channel-binding] argument
should be @racket[#f] if the client does not support channel binding
(for example, if the channel is not a TLS connection).

@history[
  #:changed "1.1" @elem{Added the @racket[#:channel-binding]
  argument and support for @tt{PLUS} mechanism variants.}

  #:changed "1.2" @elem{Added support for the @racket['sha512]
  digest.}]}

@; ----------------------------------------
@section[#:tag "sasl-cram-md5"]{@tt{CRAM-MD5} Authentication}
@defmodule[sasl/cram-md5]

This module implements the
@hyperlink["https://tools.ietf.org/html/draft-ietf-sasl-crammd5-10"]{@tt{CRAM-MD5}}
authentication mechanism.

The @tt{CRAM-MD5} protocol has the following structure:
@itemlist[#:style 'numbered
@item{server → client: challenge}
@item{client → server: response}
]
In particular, the server sends the first message, and the server communicates
authentication success or failure at the application protocol layer. Messages
are represented as strings.

@defproc[(make-cram-md5-client-ctx [authentication-id string?]
                                   [password string?])
         sasl-ctx?]{

Creates a @tt{CRAM-MD5} protocol context. The @racket[authentication-id] and
@racket[password] arguments are automatically processed using @racket[saslprep].
}

@; ----------------------------------------
@section[#:tag "sasl-plain"]{@tt{PLAIN} Authentication}
@defmodule[sasl/plain]

This module implements the
@hyperlink["https://tools.ietf.org/html/rfc4616"]{@tt{PLAIN}} mechanism.

Since the @tt{PLAIN} mechanism consists of a single message from the client to
the server, it is implemented as a simple procedure rather than a @tech{SASL
protocol context}. The authentication outcome is conveyed at the application
protocol layer.

@defproc[(plain-client-message [authentication-id string?]
                               [password string?]
                               [#:authorization-id authorization-id (or/c string? #f) #f])
         string?]{

Constructs a @tt{PLAIN} client message containig the @racket[authentication-id],
@racket[password], and (if present) @racket[authorization-id]. The arguments are
automatically processed with @racket[saslprep].
}
