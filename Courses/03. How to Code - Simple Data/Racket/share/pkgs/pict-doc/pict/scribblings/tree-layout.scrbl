#lang scribble/doc

@(require (for-label pict racket pict/tree-layout)
          pict/private/layout
          scribble/manual
          scribble/eval)

@(define tree-layout-eval (make-base-eval))
@(tree-layout-eval '(require pict/tree-layout pict))

@title{Tree Layout}

These functions specify tree layouts and functions
that render them as @racket[pict]s.

@defmodule[pict/tree-layout]

@defproc[(tree-layout [#:pict node-pict (or/c #f pict?) #f]
                      [child (or/c tree-layout? tree-edge? #f)] ...)
         tree-layout?]{
  Specifies an interior node of a tree for use with one of the renderers below.
  
  If the children are @racket[tree-layout?]s, then they have edges
  created by passing the corresponding @racket[tree-layout?]s directly
  to @racket[tree-edge]. Children that are @racket[#f] correspond to
  leaf nodes that are not drawn.
  
  The default @racket[node-pict] (used when @racket[node-pict] is @racket[#f])
  is @|default-node-pict|.
}

@defproc[(tree-edge [node (and/c tree-layout? (not/c #f))]
                    [#:edge-color edge-color
                                  (or/c string? 
                                        (is-a?/c color%)
                                        (list/c byte? byte? byte?))
                                  "gray"]
                    [#:edge-width edge-width
                                  (or/c 'unspecified real? #f)
                                  'unspecified]
                    [#:edge-style edge-style
                                  (or/c 'unspecified 'transparent 'solid 'xor 'hilite
                                        'dot 'long-dash 'short-dash 'dot-dash
                                        'xor-dot 'xor-long-dash 'xor-short-dash
                                        'xor-dot-dash)
                                  'unspecified])
         tree-edge?]{
  This function specifies an edge from some parent to the given @racket[node].
  It it intended to be used with @racket[tree-layout], on a non-@racket[#f] node.

  When @racket[edge-width] is @racket['unspecified], the line width will not be
  set. This is intended to allow the line width to be set for the whole pict
  via @racket[linewidth]. Otherwise, @racket[edge-width] is interpreted the
  same way as the width argument for the @racket[linewidth] function.
  @racket[edge-style] behaves similarly, its argument interpreted as the style
  argument for the @racket[linestyle] function.

  @examples[#:eval
            tree-layout-eval
            (naive-layered (tree-layout
                            (tree-edge #:edge-width 3 (tree-layout))
                            (tree-edge #:edge-color "red"
                                       #:edge-style 'dot
                                       (tree-layout))))]

  @history[#:changed "1.3" @list{Added the @racket[#:edge-width] option.}
           #:changed "1.9" @list{Added the @racket[#:edge-style] option.}]
}

@defproc[(tree-layout? [v any/c]) boolean?]{
  Recognizes a tree layout. It returns @racket[#t]
  when given @racket[#f] or the result of @racket[tree-layout].
}

@defproc[(binary-tree-layout? [v any/c]) boolean?]{
  Recognizes a @racket[tree-layout?] that represents
  a binary tree. That is, each interior node
  has either two children or is @racket[#f]. Note
  that a node with zero children does not count as a
  leaf for the purposes of @racket[binary-tree-layout?].
  
  @examples[#:eval 
            tree-layout-eval
            (binary-tree-layout? (tree-layout #f #f))
            (binary-tree-layout? #f)
            (binary-tree-layout? (tree-layout (tree-layout) (tree-layout)))]
}

@defproc[(tree-edge? [v any/c]) boolean?]{
  Recognizes an @racket[tree-edge].
}


@defproc[(naive-layered [tree-layout tree-layout?]
                        [#:x-spacing x-spacing (or/c (and/c real? positive?) #f) #f]
                        [#:y-spacing y-spacing (or/c (and/c real? positive?) #f) #f]
                        [#:transform transform (-> real? real? (values real? real?)) values])
         pict?]{
  Uses a naive algorithm that ensures that all nodes at a fixed
  depth are the same vertical distance from the root (dubbed ``layered'').
  It recursively lays out subtrees and then horizontally
  combines them, aligning them at their tops. Then it places
  the root node centered over the children nodes.
  
  The @racket[transform] argument applies a coordinate
  transformation to each of the nodes after it has been layed out.
  The bounding box of the resulting pict encompasses the corners
  of the original bounding box after the transformation has been
  applied to them.

  @examples[#:eval 
            tree-layout-eval
            (define (complete d)
              (cond
                [(zero? d) #f]
                [else (define s (complete (- d 1)))
                      (tree-layout s s)]))
            
            (naive-layered (complete 4))
            (naive-layered (complete 4) #:transform (lambda (x y) (values y x)))
            (naive-layered (tree-layout
                            (tree-layout)
                            (tree-layout)
                            (tree-layout
                             (tree-layout)
                             (tree-layout)
                             (tree-layout
                              (tree-layout)
                              (tree-layout)))))
            (define right-subtree-with-left-chain
              (tree-layout
               (tree-layout
                (tree-layout #f #f)
                (tree-layout
                 (tree-layout #f #f)
                 #f))
               (tree-layout
                (tree-layout
                 (tree-layout
                  (tree-layout 
                   (tree-layout #f #f)
                   #f)
                  #f)
                 #f)
                #f)))
            (naive-layered right-subtree-with-left-chain)]

  @history[#:changed "1.13" @list{Added the @racket[#:transform] option.}]
}
                
@defproc[(binary-tidier [tree-layout binary-tree-layout?]
                        [#:x-spacing x-spacing (or/c (and/c real? positive?) #f) #f]
                        [#:y-spacing y-spacing (or/c (and/c real? positive?) #f) #f]
                        [#:transform transform (-> real? real? (values real? real?)) values])
         pict?]{
  Uses the layout algorithm from
  @italic{Tidier Drawing of Trees} by Edward M. Reingold and John S. Tilford
  (IEEE Transactions on Software Engineering, Volume 7, Number 2, March 1981)
  to lay out @racket[tree-layout].
  
  The layout algorithm guarantees a number of properties, namely:
  @itemlist[@item{nodes at the same level of tree appear at 
                  the same vertical distance from the top of the pict}
             @item{parents are centered over their children, which are 
                   placed from left to right,}
             @item{isomorphic subtrees are drawn the same way, no matter
                   where they appear in the complete tree, and}
             @item{a tree and its mirror image produce picts that are
                   mirror images of each other (which also holds for subtrees
                   of the complete tree).}]
  Within those constraints, the algorithm tries to make as narrow a drawing
  as it can, even to the point that one subtree of a given node might cross
  under the other one.

  More precisely, it recursively lays out the two subtree and then,
  without adjusting the layout of the two subtrees, moves them as
  close together as it can, putting the root of the new tree centered
  on top of its children. (It does this in linear time, using clever
  techniques as discussed in the paper.)
  
  The @racket[x-spacing] and @racket[y-spacing] are the amount of space that each
  row and each column takes up, measured in pixels. If @racket[x-spacing] is @racket[#f],
  it is the width of the widest node @racket[pict?] in the tree. 
  If @racket[y-spacing] is @racket[#f],
  it is @racket[1.5] times the width of the widest node @racket[pict?] in the tree. 
  The @racket[transform] is the same as in @racket[naive-layered].
  
  @examples[#:eval 
            tree-layout-eval
            
            (binary-tidier (complete 4))

            
            (define (dl t) (tree-layout (tree-layout #f #f) t))
            (define (dr t) (tree-layout t (tree-layout #f #f)))
            (binary-tidier
             (tree-layout
              (dr (dr (dr (dl (dl (dl (complete 2)))))))
              (dl (dl (dl (dr (dr (dr (complete 2)))))))))
            
            
            (binary-tidier right-subtree-with-left-chain)]

  @history[#:changed "1.13" @list{Added the @racket[#:transform] option.}]
}

@defproc[(hv-alternating [tree-layout binary-tree-layout?]
                         [#:x-spacing x-spacing (or/c (and/c real? positive?) #f) #f]
                         [#:y-spacing y-spacing (or/c (and/c real? positive?) #f) #f]
                         [#:transform transform (-> real? real? (values real? real?)) values])
         pict?]{
                
  Uses the ``CT'' binary tree layout algorithm from 
  @italic{A note on optimal area algorithms for upward drawing of binary trees}
  by P. Crescenzi, G. Di Battista, and A. Piperno 
  (Computational Geometry, Theory and Applications, 1992) to lay out @racket[tree-layout].
  
  It adds horizontal and vertical space between layers based on @racket[x-spacing] and
  @racket[y-spacing]. If either is @racket[#f], @racket[1.5] times the size of the biggest
  node is used.  The @racket[transform] is the same as in @racket[naive-layered].
                
  @examples[#:eval 
            tree-layout-eval
            (hv-alternating (complete 8))]

  @history[#:changed "1.13" @list{Added the @racket[#:transform] option.}]
}

@history[#:added "6.0.1.4"]
