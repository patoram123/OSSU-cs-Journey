3300
((3) 0 () 4 ((q lib "graphics/turtles.rkt") (q lib "graphics/turtle-examples.rkt") (q lib "graphics/value-turtles.rkt") (q lib "graphics/value-turtles-examples.rkt")) () (h ! (equal) ((c def c (c (? . 0) q erase-offset)) q (363 . 4)) ((c def c (c (? . 2) q turtles-pict)) q (4298 . 3)) ((c def c (c (? . 0) q turn)) q (437 . 3)) ((c def c (c (? . 0) q draw-offset)) q (290 . 4)) ((c def c (c (? . 1) q sierp-size)) q (1431 . 2)) ((c def c (c (? . 3) q regular-polys)) q (4814 . 5)) ((c def c (c (? . 1) q peano-position-turtle)) q (1945 . 2)) ((c def c (c (? . 2) q move)) q (2644 . 4)) ((c def c (c (? . 0) q save-turtle-bitmap)) q (693 . 4)) ((c def c (c (? . 0) q turtles)) q (0 . 4)) ((c def c (c (? . 1) q peano-size)) q (1990 . 2)) ((c form c (c (? . 0) q tprompt)) q (665 . 2)) ((c def c (c (? . 0) q home)) q (584 . 2)) ((c def c (c (? . 2) q draw)) q (2728 . 4)) ((c def c (c (? . 1) q lorenz1)) q (1848 . 2)) ((c def c (c (? . 0) q move)) q (75 . 3)) ((c def c (c (? . 0) q turn/radians)) q (492 . 3)) ((c def c (c (? . 1) q koch-size)) q (1598 . 2)) ((c def c (c (? . 2) q restore-turtle-state)) q (4033 . 6)) ((c def c (c (? . 0) q move-offset)) q (217 . 4)) ((c def c (c (? . 1) q sierp-nosplit)) q (1524 . 3)) ((c def c (c (? . 1) q spaced-turtles)) q (1186 . 3)) ((c def c (c (? . 3) q spyro-gyra)) q (5014 . 3)) ((c form c (c (? . 0) q split*)) q (638 . 2)) ((c def c (c (? . 1) q gapped-lines)) q (1294 . 2)) ((c def c (c (? . 3) q spaced-turtles)) q (4483 . 4)) ((c def c (c (? . 2) q turtles-pen-width)) q (3600 . 3)) ((c def c (c (? . 1) q regular-polys)) q (1012 . 4)) ((c def c (c (? . 2) q turtles-height)) q (3508 . 3)) ((c def c (c (? . 1) q fern2)) q (2170 . 3)) ((c def c (c (? . 1) q spokes)) q (1264 . 2)) ((c def c (c (? . 1) q koch-draw)) q (1693 . 3)) ((c def c (c (? . 1) q lorenz)) q (1761 . 5)) ((c def c (c (? . 1) q peano)) q (1879 . 3)) ((c def c (c (? . 0) q erase)) q (169 . 3)) ((c def c (c (? . 2) q clean)) q (3351 . 3)) ((c def c (c (? . 3) q neato)) q (4598 . 3)) ((c def c (c (? . 3) q regular-poly)) q (4664 . 5)) ((c def c (c (? . 1) q koch-split)) q (1624 . 3)) ((c def c (c (? . 1) q spyro-gyra)) q (1330 . 2)) ((c def c (c (? . 1) q radial-turtles)) q (1108 . 3)) ((c def c (c (? . 2) q set-pen-color)) q (3117 . 4)) ((c def c (c (? . 1) q fern1)) q (2085 . 3)) ((c def c (c (? . 0) q clear)) q (555 . 2)) ((c def c (c (? . 3) q radial-turtles)) q (4368 . 4)) ((c def c (c (? . 2) q turn/radians)) q (2904 . 4)) ((c def c (c (? . 1) q regular-poly)) q (899 . 4)) ((c form c (c (? . 0) q split)) q (612 . 2)) ((c def c (c (? . 1) q sierp)) q (1458 . 3)) ((c def c (c (? . 2) q turtles)) q (2255 . 11)) ((c def c (c (? . 1) q neato)) q (1364 . 2)) ((c def c (c (? . 2) q turtles?)) q (2590 . 3)) ((c def c (c (? . 2) q set-pen-width)) q (3004 . 4)) ((c def c (c (? . 3) q spokes)) q (4947 . 3)) ((c def c (c (? . 2) q turtles-width)) q (3417 . 3)) ((c def c (c (? . 2) q turn)) q (2812 . 4)) ((c def c (c (? . 0) q turtle-window-size)) q (846 . 2)) ((c def c (c (? . 2) q turtles-pen-color)) q (3687 . 3)) ((c def c (c (? . 1) q graphics-bexam)) q (1393 . 2)) ((c def c (c (? . 2) q merge)) q (3247 . 4)) ((c def c (c (? . 2) q turtle-state)) q (3774 . 5)) ((c def c (c (? . 1) q fern-size)) q (2038 . 2)) ((c def c (c (? . 0) q draw)) q (122 . 3))))
procedure
(turtles on?) -> void?
  on? : any/c
(turtles) -> void?
procedure
(move n) -> void?
  n : real?
procedure
(draw n) -> void?
  n : real?
procedure
(erase n) -> void?
  n : real?
procedure
(move-offset h v) -> void?
  h : real?
  v : real?
procedure
(draw-offset h v) -> void?
  h : real?
  v : real?
procedure
(erase-offset h v) -> void?
  h : real?
  v : real?
procedure
(turn theta) -> void?
  theta : real?
procedure
(turn/radians theta) -> void?
  theta : real?
procedure
(clear) -> void?
procedure
(home) -> void?
syntax
(split expr ...)
syntax
(split* expr ...)
syntax
(tprompt expr ...)
procedure
(save-turtle-bitmap name kind) -> void?
  name : (or/c path-string? output-port?)
  kind : (or/c 'png 'jpeg 'xbm 'xpm 'bmp)
value
turtle-window-size : exact-positive-integer?
procedure
(regular-poly sides radius) -> void?
  sides : exact-nonnegative-integer?
  radius : real?
procedure
(regular-polys n s) -> void?
  n : exact-nonnegative-integer?
  s : any/c
procedure
(radial-turtles n) -> void?
  n : exact-nonnegative-integer?
procedure
(spaced-turtles n) -> void?
  n : exact-nonnegative-integer?
procedure
(spokes) -> void?
procedure
(gapped-lines) -> void?
procedure
(spyro-gyra) -> void?
procedure
(neato) -> void?
procedure
(graphics-bexam) -> void?
value
sierp-size : real?
procedure
(sierp sierp-size) -> void?
  sierp-size : real?
procedure
(sierp-nosplit sierp-size) -> void?
  sierp-size : real?
value
koch-size : real?
procedure
(koch-split koch-size) -> void?
  koch-size : real?
procedure
(koch-draw koch-size) -> void?
  koch-size : real?
procedure
(lorenz a b c) -> void?
  a : real?
  b : real?
  c : real?
procedure
(lorenz1) -> void?
procedure
(peano peano-size) -> void?
  peano-size : real?
procedure
(peano-position-turtle) -> void?
value
peano-size : exact-nonnegative-integer?
value
fern-size : exact-nonnegative-integer?
procedure
(fern1 fern-size) -> void?
  fern-size : exact-nonnegative-integer?
procedure
(fern2 fern-size) -> void?
  fern-size : exact-nonnegative-integer?
procedure
(turtles  width            
          height           
         [init-x           
          init-y           
          init-angle]) -> turtles?
  width : real?
  height : real?
  init-x : real? = (/ width 2)
  init-y : real? = (/ height 2)
  init-angle : real? = 0
procedure
(turtles? v) -> boolean?
  v : any/c
procedure
(move n turtles) -> turtles?
  n : real?
  turtles : turtles?
procedure
(draw n turtles) -> turtles?
  n : real?
  turtles : turtles?
procedure
(turn theta turtles) -> turtles?
  theta : real?
  turtles : turtles?
procedure
(turn/radians theta turtles) -> turtles?
  theta : real?
  turtles : turtles?
procedure
(set-pen-width turtles width) -> turtles?
  turtles : turtles?
  width : (real-in 0 255)
procedure
(set-pen-color turtles color) -> turtles?
  turtles : turtles?
  color : (or/c string? (is-a?/c color%))
procedure
(merge turtles1 turtles2) -> turtles?
  turtles1 : turtles?
  turtles2 : turtles?
procedure
(clean turtles) -> turtles?
  turtles : turtles?
procedure
(turtles-width turtles) -> (and/c real? positive?)
  turtles : turtles?
procedure
(turtles-height turtles) -> (and/c real? positive?)
  turtles : turtles?
procedure
(turtles-pen-width turtles) -> (real-in 0 255)
  turtles : turtles?
procedure
(turtles-pen-color turtles) -> (is-a?/c color%)
  turtles : turtles?
procedure
(turtle-state turtles) -> (listof (vector/c real? real? real?
                                            #:immutable? #t
                                            #:flat? #t))
  turtles : turtles?
procedure
(restore-turtle-state turtles state) -> turtles?
  turtles : turtles?
  state : (listof (vector/c real? real? real?
                            #:immutable? #t
                            #:flat? #t))
procedure
(turtles-pict turtles) -> pict?
  turtles : turtles?
procedure
(radial-turtles n turtles) -> turtles?
  n : exact-nonnegative-integer?
  turtles : turtles?
procedure
(spaced-turtles n turtles) -> turtles?
  n : exact-nonnegative-integer?
  turtles : turtles?
procedure
(neato turtles) -> turtles?
  turtles : turtles?
procedure
(regular-poly sides radius turtles) -> turtles?
  sides : exact-nonnegative-integer?
  radius : real?
  turtles : turtles?
procedure
(regular-polys n s turtles) -> turtles?
  n : exact-nonnegative-integer?
  s : any/c
  turtles : turtles?
procedure
(spokes turtles) -> turtles?
  turtles : turtles?
procedure
(spyro-gyra turtles) -> turtles?
  turtles : turtles?
