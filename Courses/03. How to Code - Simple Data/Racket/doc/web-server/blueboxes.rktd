17813
((3) 0 () 50 ((q lib "web-server/lang/stuff-url.rkt") (q lib "web-server/http/request-structs.rkt") (q lib "web-server/formlets/input.rkt") (q lib "web-server/page.rkt") (q lib "web-server/managers/manager.rkt") (q lib "web-server/servlet/web.rkt") (q 8031 . 7) (q lib "web-server/formlets/lib.rkt") (q lib "web-server/stuffers/stuffer.rkt") (q 12501 . 5) (q lib "web-server/http/cookie-parse.rkt") (q 23094 . 7) (q lib "web-server/dispatch.rkt") (q lib "web-server/http/id-cookie.rkt") (q 15805 . 18) (q lib "web-server/http/bindings.rkt") (q lib "web-server/lang/web-cells.rkt") (q lib "web-server/managers/lru.rkt") (q lib "web-server/test.rkt") (q 7165 . 17) (q lib "web-server/http/digest-auth.rkt") (q lib "web-server/lang/abort-resume.rkt") (q 8324 . 7) (q lib "web-server/http/response-structs.rkt") (q lib "web-server/formlets/syntax.rkt") (q lib "web-server/lang/web.rkt") (q lib "web-server/formlets/servlet.rkt") (q 14893 . 6) (q 14676 . 4) (q 14772 . 4) (q 17091 . 8) (q lib "web-server/stuffers/store.rkt") (q 13464 . 5) (q lib "web-server/scribblings/dummy-stateless-servlet.rkt") (q lib "web-server/insta/insta.rkt") (q lib "web-server/stuffers/hash.rkt") (q lib "web-server/lang/soft.rkt") (q lib "web-server/http/redirect.rkt") (q lib "web-server/servlet/servlet-structs.rkt") (q lib "web-server/servlet/web-cells.rkt") (q lib "web-server/lang/web-param.rkt") (q lib "web-server/scribblings/dummy-v2-servlet.rkt") (q 14316 . 5) (q lib "web-server/lang/file-box.rkt") (q lib "web-server/dispatch/extend.rkt") (q lib "web-server/templates.rkt") (q lib "web-server/http/cookie.rkt") (q lib "web-server/http/basic-auth.rkt") (q lib "web-server/stuffers/hmac-sha1.rkt") (q lib "web-server/formlets/dyn-syntax.rkt")) () (h ! (equal) ((c def c (c (? . 7) q xml-forest)) q (28986 . 3)) ((c def c (c (? . 2) q make-input*)) q (29668 . 3)) ((c def c (c (? . 15) q extract-binding/single)) q (16707 . 4)) ((c def c (c (? . 0) q make-default-stuffer)) q (14150 . 3)) ((c def c (c (? . 10) q client-cookie-path)) c (? . 11)) ((c def c (c (? . 3) q get-binding)) q (37976 . 6)) ((c def c (c (? . 0) q default-stuffer)) q (14255 . 2)) ((c def c (c (? . 5) q send/forward)) q (5877 . 3)) ((c def c (c (? . 4) q struct:exn:fail:servlet-manager:no-continuation)) c (? . 22)) ((c form c (c (? . 12) q integer-arg)) q (28048 . 2)) ((c def c (c (? . 1) q request-bindings/raw)) q (16368 . 3)) ((c def c (c (? . 1) q binding:file-headers)) c (? . 27)) ((c def c (c (? . 2) q to-string)) q (36421 . 3)) ((c def c (c (? . 3) q current-request)) q (37809 . 4)) ((c def c (c (? . 2) q to-boolean)) q (36666 . 3)) ((c def c (c (? . 1) q headers-assq)) q (14443 . 4)) ((c def c (c (? . 43) q file-box-set!)) q (12009 . 4)) ((c def c (c (? . 3) q binding-format/c)) q (37939 . 2)) ((c def c (c (? . 16) q web-cell?)) q (11498 . 3)) ((c def c (c (? . 4) q exn:fail:servlet-manager:no-instance)) c (? . 6)) ((c def c (c (? . 1) q request-host-ip)) c (? . 14)) ((c def c (c (? . 18) q tester/c)) q (38404 . 2)) ((c def c (c (? . 36) q make-soft-state)) q (12329 . 3)) ((c def c (c (? . 5) q clear-continuation-table!)) q (6433 . 2)) ((c def c (c (? . 4) q make-exn:fail:servlet-manager:no-instance)) c (? . 6)) ((c def c (c (? . 5) q continuation-url?)) q (6750 . 4)) ((c def c (c (? . 20) q username*realm->digest-HA1/c)) q (24499 . 2)) ((c def c (c (? . 13) q make-id-cookie)) q (19473 . 41)) ((c def c (c (? . 3) q get-bindings)) q (38189 . 6)) ((c def c (c (? . 7) q cross*)) q (28830 . 4)) ((c def c (c (? . 7) q text)) q (29132 . 3)) ((c def c (c (? . 8) q struct:stuffer)) c (? . 9)) ((c def c (c (? . 7) q formlet/c)) q (28533 . 3)) ((c def c (c (? . 35) q hash-stuffer)) q (13726 . 4)) ((c form c (c (? . 24) q formlet)) q (28382 . 2)) ((c form c (c (? . 40) q make-web-parameter)) q (12097 . 2)) ((q def ((lib "web-server/stuffers/serialize.rkt") serialize-stuffer)) q (13297 . 2)) ((c def c (c (? . 2) q multiselect-input)) q (35254 . 11)) ((c def c (c (? . 48) q HMAC-SHA1)) q (13925 . 4)) ((c def c (c (? . 8) q make-stuffer)) c (? . 9)) ((c def c (c (? . 10) q make-client-cookie)) c (? . 11)) ((c def c (c (? . 37) q see-other)) q (23824 . 2)) ((c def c (c (? . 4) q manager-continuation-store!)) c (? . 19)) ((c def c (c (? . 23) q response-output)) c (? . 30)) ((c form c (c (? . 12) q dispatch-rules)) q (26752 . 22)) ((c def c (c (? . 2) q radio)) q (32138 . 6)) ((c def c (c (? . 13) q logout-id-cookie)) q (22719 . 7)) ((c def c (c (? . 1) q struct:request)) c (? . 14)) ((c def c (c (? . 26) q embed-formlet)) q (37309 . 4)) ((c def c (c (? . 15) q extract-bindings)) q (16836 . 4)) ((c def c (c (? . 17) q make-threshold-LRU-manager)) q (9929 . 7)) ((c def c (c (? . 7) q formlet*/c)) q (28610 . 2)) ((c form c (c (? . 16) q make-web-cell)) q (11553 . 2)) ((c def c (c (? . 17) q create-LRU-manager)) q (9207 . 14)) ((c def c (c (? . 18) q make-servlet-tester)) q (38433 . 4)) ((c def c (c (? . 4) q struct:exn:fail:servlet-manager:no-instance)) c (? . 6)) ((c def c (c (? . 1) q request)) c (? . 14)) ((c def c (c (? . 7) q formlet-display)) q (29368 . 3)) ((q form ((lib "web-server/lang/native.rkt") define-native)) q (10655 . 5)) ((c def c (c (? . 12) q serve/dispatch)) q (27728 . 3)) ((c def c (c (? . 3) q binding-id/c)) q (37906 . 2)) ((c def c (c (? . 8) q stuffer-out)) c (? . 9)) ((c form c (c (? . 21) q native->serial)) q (10625 . 2)) ((c def c (c (? . 16) q web-cell-ref)) q (11590 . 3)) ((c def c (c (? . 7) q tag-xexpr)) q (29199 . 5)) ((c def c (c (? . 4) q manager-create-instance)) c (? . 19)) ((c def c (c (? . 13) q make-secret-salt/file)) q (22992 . 3)) ((c def c (c (? . 20) q make-digest-auth-header)) q (24096 . 7)) ((c form c (c (? . 21) q serial->native)) q (10595 . 2)) ((c def c (c (? . 2) q submit)) q (33382 . 5)) ((c def c (c (? . 18) q make-dispatcher-tester)) q (38556 . 3)) ((c def c (c (? . 25) q send/suspend/hidden)) q (10986 . 3)) ((c def c (c (? . 2) q img)) q (34113 . 15)) ((c def c (c (? . 7) q xml)) q (29066 . 3)) ((c def c (c (? . 7) q formlet-process)) q (29448 . 4)) ((c def c (c (? . 4) q exn:fail:servlet-manager:no-continuation?)) c (? . 22)) ((c def c (c (? . 23) q TEXT/HTML-MIME-TYPE)) q (18401 . 2)) ((c def c (c (? . 5) q send/back)) q (5272 . 3)) ((c def c (c (? . 8) q stuffer/c)) q (12652 . 4)) ((q def ((lib "web-server/http/empty.rkt") response/empty)) q (25606 . 11)) ((c def c (c (? . 2) q select-input)) q (35782 . 9)) ((c form c (c (? . 24) q #%#)) q (28429 . 2)) ((c form c (c (? . 45) q include-template)) q (37457 . 3)) ((c def c (c (? . 25) q send/suspend)) q (10871 . 3)) ((c def c (c (? . 4) q manager-adjust-timeout!)) c (? . 19)) ((c def c (c (? . 39) q make-web-cell)) q (6962 . 3)) ((c def c (c (? . 4) q manager?)) c (? . 19)) ((c def c (c (? . 26) q send/formlet)) q (36878 . 10)) ((c def c (c (? . 1) q binding:file-content)) c (? . 27)) ((c def c (c (? . 1) q make-binding:form)) c (? . 29)) ((c def c (c (? . 31) q store-write)) c (? . 32)) ((c def c (c (? . 46) q cookie->header)) q (19412 . 3)) ((c def c (c (? . 2) q required)) q (36202 . 3)) ((c def c (c (? . 25) q send/suspend/url/dispatch)) q (11114 . 3)) ((c def c (c (? . 1) q struct:binding:file)) c (? . 27)) ((c def c (c (? . 1) q make-binding:file)) c (? . 27)) ((c def c (c (? . 1) q request-client-ip)) c (? . 14)) ((c def c (c (? . 1) q struct:binding)) c (? . 28)) ((c def c (c (? . 8) q stuffer-if)) q (13057 . 4)) ((c def c (c (? . 16) q web-cell-shadow)) q (11651 . 4)) ((c def c (c (? . 23) q APPLICATION/JSON-MIME-TYPE)) q (18438 . 2)) ((c def c (c (? . 10) q request-cookies)) q (23382 . 3)) ((c def c (c (? . 2) q reset)) q (33575 . 5)) ((c def c (c (? . 1) q binding)) c (? . 28)) ((c def c (c (? . 38) q can-be-response?)) q (5007 . 3)) ((c def c (c (? . 8) q id-stuffer)) q (12735 . 2)) ((c def c (c (? . 34) q no-web-browser)) q (0 . 2)) ((c def c (c (? . 7) q pure)) q (28641 . 3)) ((c def c (c (? . 5) q servlet-prompt)) q (6857 . 2)) ((c def c (c (? . 5) q send/suspend/dispatch)) q (5574 . 4)) ((c def c (c (? . 4) q make-exn:fail:servlet-manager:no-continuation)) c (? . 22)) ((q def ((lib "web-server/managers/none.rkt") create-none-manager)) q (8625 . 4)) ((c def c (c (? . 4) q struct:manager)) c (? . 19)) ((c form c (c (? . 12) q dispatch-case)) q (27539 . 4)) ((c def c (c (? . 33) q start)) q (10370 . 3)) ((c def c (c (? . 1) q binding?)) c (? . 28)) ((c def c (c (? . 20) q request->digest-credentials)) q (24326 . 4)) ((c form c (c (? . 12) q symbol-arg)) q (28107 . 2)) ((c def c (c (? . 2) q input-string)) q (36749 . 2)) ((c def c (c (? . 1) q binding:form)) c (? . 29)) ((c def c (c (? . 25) q send/suspend/dispatch)) q (11259 . 4)) ((c def c (c (? . 1) q binding:form-value)) c (? . 29)) ((c def c (c (? . 1) q make-request)) c (? . 14)) ((c def c (c (? . 23) q response-headers)) c (? . 30)) ((c def c (c (? . 31) q store?)) c (? . 32)) ((c def c (c (? . 5) q current-servlet-continuation-expiration-handler)) q (6265 . 4)) ((c form c (c (? . 3) q lambda/page)) q (37725 . 2)) ((c def c (c (? . 2) q make-input)) q (29551 . 3)) ((c def c (c (? . 13) q request-id-cookie)) q (21360 . 23)) ((c def c (c (? . 4) q exn:fail:servlet-manager:no-instance?)) c (? . 6)) ((c def c (c (? . 1) q request-uri)) c (? . 14)) ((c form c (c (? . 12) q dispatch-rules+applies)) q (27464 . 4)) ((c def c (c (? . 2) q text-input)) q (30360 . 12)) ((c def c (c (? . 2) q password-input)) q (30908 . 12)) ((c def c (c (? . 1) q struct:binding:form)) c (? . 29)) ((c form c (c (? . 3) q embed/url)) q (37708 . 2)) ((c def c (c (? . 33) q stuffer)) q (10290 . 2)) ((c def c (c (? . 8) q stuffer-sequence)) q (12919 . 4)) ((c def c (c (? . 2) q textarea-input)) q (31476 . 10)) ((c def c (c (? . 2) q checkbox)) q (31907 . 6)) ((q def ((lib "web-server/stuffers/base64.rkt") base64-stuffer)) q (13360 . 2)) ((c def c (c (? . 34) q static-files-path)) q (37 . 3)) ((c def c (c (? . 35) q md5-stuffer)) q (13836 . 3)) ((c form c (c (? . 36) q soft-state)) q (12470 . 2)) ((c def c (c (? . 15) q request-headers)) q (16611 . 3)) ((c def c (c (? . 36) q soft-state-ref)) q (12405 . 3)) ((c def c (c (? . 1) q bindings-assq)) q (15570 . 4)) ((c def c (c (? . 1) q request-post-data/raw)) c (? . 14)) ((c def c (c (? . 10) q client-cookie?)) c (? . 11)) ((c form c (c (? . 49) q =>*)) q (28487 . 2)) ((c def c (c (? . 37) q redirect-to)) q (23466 . 5)) ((c def c (c (? . 1) q header-field)) c (? . 42)) ((c def c (c (? . 10) q client-cookie-domain)) c (? . 11)) ((c def c (c (? . 37) q permanently)) q (23864 . 2)) ((c def c (c (? . 38) q any->response)) q (5069 . 3)) ((c def c (c (? . 4) q exn:fail:servlet-manager:no-continuation)) c (? . 22)) ((c def c (c (? . 25) q redirect/get)) q (11403 . 3)) ((c def c (c (? . 41) q interface-version)) q (4846 . 2)) ((c def c (c (? . 38) q set-any->response!)) q (5146 . 3)) ((c def c (c (? . 10) q struct:client-cookie)) c (? . 11)) ((c form c (c (? . 12) q real-arg)) q (28069 . 2)) ((c def c (c (? . 31) q struct:store)) c (? . 32)) ((c def c (c (? . 4) q exn:fail:servlet-manager:no-continuation-expiration-handler)) c (? . 22)) ((c form c (c (? . 12) q define-container)) q (27885 . 2)) ((c def c (c (? . 2) q input-symbol)) q (36834 . 2)) ((c def c (c (? . 31) q store-read)) c (? . 32)) ((c def c (c (? . 39) q web-cell-ref)) q (7022 . 3)) ((c def c (c (? . 5) q adjust-timeout!)) q (6690 . 3)) ((c def c (c (? . 1) q bindings-assq-all)) q (15689 . 4)) ((q def ((lib "web-server/stuffers/gzip.rkt") gzip-stuffer)) q (13413 . 2)) ((c def c (c (? . 40) q web-parameter?)) q (12134 . 3)) ((c def c (c (? . 15) q request-bindings)) q (16447 . 5)) ((c def c (c (? . 8) q stuffer-chain)) q (13194 . 3)) ((c def c (c (? . 4) q exn:fail:servlet-manager:no-instance-expiration-handler)) c (? . 6)) ((c def c (c (? . 37) q temporarily)) q (23728 . 2)) ((c def c (c (? . 2) q file-upload)) q (33767 . 4)) ((c def c (c (? . 10) q client-cookie-name)) c (? . 11)) ((c def c (c (? . 41) q start)) q (4917 . 3)) ((c form c (c (? . 44) q define-coercion-match-expander)) q (28216 . 2)) ((c def c (c (? . 5) q with-errors-to-browser)) q (6482 . 5)) ((c def c (c (? . 1) q make-binding)) c (? . 28)) ((c def c (c (? . 23) q response-seconds)) c (? . 30)) ((q def ((lib "web-server/http/json.rkt") response/jsexpr)) q (26072 . 15)) ((c def c (c (? . 1) q header)) c (? . 42)) ((c def c (c (? . 23) q response-message)) c (? . 30)) ((c def c (c (? . 1) q make-binding:file/port)) q (15251 . 9)) ((c def c (c (? . 43) q file-box?)) q (11733 . 3)) ((c def c (c (? . 1) q binding:file/port?)) q (15187 . 3)) ((c form c (c (? . 44) q bidi-match-going-in?)) q (28188 . 2)) ((c def c (c (? . 1) q binding-id)) c (? . 28)) ((c def c (c (? . 10) q client-cookie-value)) c (? . 11)) ((c def c (c (? . 20) q password->digest-HA1)) q (24548 . 4)) ((c def c (c (? . 43) q file-box)) q (11788 . 4)) ((c def c (c (? . 15) q exists-binding?)) q (16969 . 4)) ((c def c (c (? . 31) q make-store)) c (? . 32)) ((c def c (c (? . 7) q cross)) q (28709 . 4)) ((c def c (c (? . 37) q redirection-status?)) q (23663 . 3)) ((c def c (c (? . 0) q is-url-too-big?)) q (14088 . 3)) ((c def c (c (? . 4) q manager-continuation-lookup)) c (? . 19)) ((c form c (c (? . 44) q define-bidi-match-expander)) q (28127 . 2)) ((c def c (c (? . 2) q input-int)) q (36793 . 2)) ((c def c (c (? . 13) q valid-id-cookie?)) q (22268 . 12)) ((c def c (c (? . 5) q redirect/get/forget)) q (6163 . 3)) ((c def c (c (? . 1) q request-headers/raw)) c (? . 14)) ((c def c (c (? . 2) q checkbox-group)) q (32933 . 11)) ((c def c (c (? . 2) q hidden)) q (33920 . 5)) ((c form c (c (? . 45) q include-template/xml)) q (37554 . 3)) ((c def c (c (? . 23) q response-mime)) c (? . 30)) ((c def c (c (? . 1) q make-header)) c (? . 42)) ((c def c (c (? . 4) q manager-clear-continuations!)) c (? . 19)) ((c def c (c (? . 1) q binding:file/port-in)) q (15093 . 3)) ((c def c (c (? . 1) q binding:form?)) c (? . 29)) ((c def c (c (? . 25) q send/suspend/url)) q (10755 . 3)) ((c def c (c (? . 1) q binding:file?)) c (? . 27)) ((c def c (c (? . 39) q web-cell-shadow)) q (7083 . 4)) ((c def c (c (? . 4) q manager-continuation-peek)) c (? . 19)) ((c def c (c (? . 23) q response)) c (? . 30)) ((c form c (c (? . 12) q number-arg)) q (28028 . 2)) ((c def c (c (? . 35) q hash-fun/c)) q (13695 . 2)) ((c def c (c (? . 1) q request?)) c (? . 14)) ((c def c (c (? . 2) q button)) q (34798 . 12)) ((c def c (c (? . 43) q file-unbox)) q (11877 . 3)) ((c def c (c (? . 20) q username*realm->password/c)) q (24452 . 2)) ((c def c (c (? . 44) q make-coerce-safe?)) q (28275 . 3)) ((c def c (c (? . 4) q manager)) c (? . 19)) ((c def c (c (? . 5) q send/suspend)) q (5349 . 3)) ((c def c (c (? . 1) q request-host-port)) c (? . 14)) ((c def c (c (? . 39) q web-cell?)) q (6907 . 3)) ((c def c (c (? . 5) q send/suspend/url/dispatch)) q (5725 . 4)) ((c def c (c (? . 23) q response/output)) q (17811 . 13)) ((c def c (c (? . 1) q request-method)) c (? . 14)) ((c def c (c (? . 4) q make-manager)) c (? . 19)) ((c def c (c (? . 8) q stuffer?)) c (? . 9)) ((c form c (c (? . 45) q in)) q (37659 . 2)) ((c def c (c (? . 46) q make-cookie)) q (18482 . 21)) ((c form c (c (? . 40) q web-parameterize)) q (12194 . 2)) ((c def c (c (? . 20) q make-check-digest-credentials)) q (24684 . 4)) ((c def c (c (? . 21) q call-with-serializable-current-continuation)) q (10453 . 4)) ((c def c (c (? . 43) q file-box-set?)) q (11944 . 3)) ((c def c (c (? . 23) q response-code/c)) q (17342 . 2)) ((c def c (c (? . 47) q request->basic-credentials)) q (23983 . 4)) ((c def c (c (? . 2) q to-number)) q (36502 . 3)) ((c def c (c (? . 5) q send/finish)) q (5989 . 3)) ((c def c (c (? . 33) q interface-version)) q (10239 . 2)) ((c def c (c (? . 2) q radio-group)) q (32366 . 12)) ((c def c (c (? . 23) q response-code)) c (? . 30)) ((c def c (c (? . 1) q header-value)) c (? . 42)) ((c def c (c (? . 5) q send/suspend/url)) q (5461 . 3)) ((c def c (c (? . 33) q manager)) q (10343 . 2)) ((c form c (c (? . 3) q define/page)) q (37763 . 2)) ((c def c (c (? . 8) q stuffer-in)) c (? . 9)) ((c def c (c (? . 2) q to-symbol)) q (36584 . 3)) ((c def c (c (? . 8) q stuffer)) c (? . 9)) ((c def c (c (? . 37) q temporarily/same-method)) q (23770 . 2)) ((q def ((lib "web-server/servlet-env.rkt") serve/servlet)) q (109 . 78)) ((c def c (c (? . 12) q container?)) q (27829 . 3)) ((c def c (c (? . 1) q binding:file)) c (? . 27)) ((c def c (c (? . 23) q response?)) c (? . 30)) ((c def c (c (? . 2) q default)) q (36300 . 4)) ((c def c (c (? . 8) q stuffer-compose)) q (12782 . 4)) ((c def c (c (? . 31) q store)) c (? . 32)) ((c def c (c (? . 10) q client-cookie)) c (? . 11)) ((c def c (c (? . 23) q response/full)) q (17410 . 13)) ((c def c (c (? . 1) q header?)) c (? . 42)) ((c def c (c (? . 2) q input)) q (29779 . 14)) ((c form c (c (? . 3) q page)) q (37686 . 2)) ((q def ((lib "web-server/http/xexpr.rkt") response/xexpr)) q (24858 . 17)) ((c def c (c (? . 36) q soft-state?)) q (12272 . 3)) ((c def c (c (? . 7) q xexpr-forest/c)) q (28498 . 2)) ((c def c (c (? . 1) q request-bindings/raw-promise)) c (? . 14)) ((c def c (c (? . 23) q struct:response)) c (? . 30)) ((c def c (c (? . 1) q headers-assq*)) q (14559 . 4)) ((c def c (c (? . 47) q make-basic-auth-header)) q (23906 . 3)) ((q def ((lib "web-server/managers/timeouts.rkt") create-timeout-manager)) q (8833 . 8)) ((c def c (c (? . 31) q dir-store)) q (13629 . 3)) ((c def c (c (? . 1) q struct:header)) c (? . 42)) ((c def c (c (? . 41) q manager)) q (4890 . 2)) ((c form c (c (? . 12) q string-arg)) q (28087 . 2)) ((c form c (c (? . 12) q dispatch-rules!)) q (27948 . 2)) ((c form c (c (? . 12) q dispatch-url)) q (27605 . 6)) ((c def c (c (? . 48) q HMAC-SHA1-stuffer)) q (14003 . 3)) ((c form c (c (? . 49) q formlet*)) q (28440 . 2)) ((c def c (c (? . 1) q binding:file-filename)) c (? . 27)) ((c def c (c (? . 5) q redirect/get)) q (6068 . 3))))
procedure
(no-web-browser) -> void
procedure
(static-files-path path) -> void
  path : path-string?
procedure
(serve/servlet                                                         
                start                                                  
               [#:command-line? command-line?                          
                #:connection-close? connection-close?                  
                #:launch-browser? launch-browser?                      
                #:quit? quit?                                          
                #:banner? banner?                                      
                #:listen-ip listen-ip                                  
                #:port port                                            
                #:max-waiting max-waiting                              
                #:safety-limits safety-limits                          
                #:servlet-path servlet-path                            
                #:servlet-regexp servlet-regexp                        
                #:stateless? stateless?                                
                #:stuffer stuffer                                      
                #:manager manager                                      
                #:servlet-namespace servlet-namespace                  
                #:server-root-path server-root-path                    
                #:extra-files-paths extra-files-paths                  
                #:servlets-root servlets-root                          
                #:servlet-current-directory servlet-current-directory  
                #:file-not-found-responder file-not-found-responder    
                #:servlet-loading-responder responders-servlet-loading 
                #:servlet-responder responders-servlet                 
                #:mime-types-path mime-types-path                      
                #:ssl? ssl?                                            
                #:ssl-cert ssl-cert                                    
                #:ssl-key ssl-key                                      
                #:log-file log-file                                    
                #:log-format log-format])                              
 -> any
  start : (request? . -> . can-be-response?)
  command-line? : boolean? = #f
  connection-close? : boolean? = #f
  launch-browser? : boolean? = (not command-line?)
  quit? : boolean? = (not command-line?)
  banner? : boolean? = (not command-line?)
  listen-ip : (or/c #f string?) = "127.0.0.1"
  port : listen-port-number? = 8000
  max-waiting : exact-nonnegative-integer? = 511
  safety-limits : safety-limits?
                = (make-safety-limits #:max-waiting max-waiting)
  servlet-path : string? = "/servlets/standalone.rkt"
  servlet-regexp : regexp?
                 = (regexp
                    (format "^~a$" (regexp-quote servlet-path)))
  stateless? : boolean? = #f
  stuffer : (stuffer/c serializable? bytes?) = default-stuffer
  manager : manager?
          = (make-threshold-LRU-manager #f (* 128 1024 1024))
  servlet-namespace : (listof module-path?) = empty
  server-root-path : path-string?
                   = (collection-path "web-server" "default-web-root")
  extra-files-paths : (listof path-string?)
                    = (list (build-path server-root-path "htdocs"))
  servlets-root : path-string?
                = (build-path server-root-path "htdocs")
  servlet-current-directory : path-string? = servlets-root
  file-not-found-responder : (request? . -> . can-be-response?)
                           = (gen-file-not-found-responder
                              (build-path
                               server-root-path
                               "conf"
                               "not-found.html"))
  responders-servlet-loading : (url? any/c . -> . can-be-response?)
                             = servlet-loading-responder
  responders-servlet : (url? any/c . -> . can-be-response?)
                     = servlet-error-responder
  mime-types-path : path-string? = ....
  ssl? : boolean? = #f
  ssl-cert : (or/c #f path-string?)
           = (and ssl? (build-path server-root-path "server-cert.pem"))
  ssl-key : (or/c #f path-string?)
          = (and ssl? (build-path server-root-path "private-key.pem"))
  log-file : (or/c #f path-string? output-port?) = #f
  log-format : (or/c log-format/c format-req/c)
             = 'apache-default
value
interface-version : (one-of/c 'v2)
value
manager : manager?
procedure
(start initial-request) -> can-be-response?
  initial-request : request?
procedure
(can-be-response? x) -> boolean?
  x : any/c
procedure
(any->response x) -> (or/c false/c response?)
  x : any/c
procedure
(set-any->response! new-any->response) -> void
  new-any->response : (-> any/c (or/c false/c response?))
procedure
(send/back response) -> void?
  response : can-be-response?
procedure
(send/suspend make-response) -> request?
  make-response : (string? . -> . can-be-response?)
procedure
(send/suspend/url make-response) -> request?
  make-response : (url? . -> . can-be-response?)
procedure
(send/suspend/dispatch make-response) -> any
  make-response : (((request? . -> . any) . -> . string?) . ->
. can-be-response?)
procedure
(send/suspend/url/dispatch make-response) -> any
  make-response : (((request? . -> . any) . -> . url?) . ->
. can-be-response?)
procedure
(send/forward make-response) -> request?
  make-response : (string? . -> . can-be-response?)
procedure
(send/finish response) -> void?
  response : can-be-response?
procedure
(redirect/get [#:headers hs]) -> request?
  hs : (listof header?) = empty
procedure
(redirect/get/forget [#:headers hs]) -> request?
  hs : (listof header?) = empty
value
current-servlet-continuation-expiration-handler
 : (parameter/c (or/c false/c
                      (request? . -> . can-be-response?)))
procedure
(clear-continuation-table!) -> void?
procedure
(with-errors-to-browser send/finish-or-back     
                        thunk)              -> any
  send/finish-or-back : (can-be-response? . -> . request?)
  thunk : (-> any)
procedure
(adjust-timeout! t) -> void?
  t : number?
procedure
(continuation-url? u)
 -> (or/c false/c (list/c number? number? number?))
  u : url?
value
servlet-prompt : continuation-prompt-tag?
procedure
(web-cell? v) -> boolean?
  v : any/c
procedure
(make-web-cell v) -> web-cell?
  v : any/c
procedure
(web-cell-ref wc) -> any/c
  wc : web-cell?
procedure
(web-cell-shadow wc v) -> void
  wc : web-cell?
  v : any/c
struct
(struct manager (create-instance
                 adjust-timeout!
                 clear-continuations!
                 continuation-store!
                 continuation-lookup
                 continuation-peek)
    #:extra-constructor-name make-manager)
  create-instance : ((-> void) . -> . number?)
  adjust-timeout! : (number? number? . -> . void)
  clear-continuations! : (number? . -> . void)
  continuation-store! : (number? any/c
                                 (or/c false/c
                                       (request? . -> . can-be-response?))
                                 . -> . (list/c number? number?))
  continuation-lookup : (number? number? number? . -> . any/c)
  continuation-peek : (number? number? number? . -> . any/c)
struct
(struct exn:fail:servlet-manager:no-instance exn:fail
        (expiration-handler)
    #:extra-constructor-name
    make-exn:fail:servlet-manager:no-instance)
  expiration-handler : (or/c false/c
                             (request? . -> . can-be-response?))
struct
(struct exn:fail:servlet-manager:no-continuation exn:fail
        (expiration-handler)
    #:extra-constructor-name
    make-exn:fail:servlet-manager:no-continuation)
  expiration-handler : (or/c false/c
                             (request? . -> . can-be-response?))
procedure
(create-none-manager instance-expiration-handler) -> manager?
  instance-expiration-handler : (or/c false/c
                                      (request? . -> . can-be-response?))
procedure
(create-timeout-manager instance-exp-handler      
                        instance-timeout          
                        continuation-timeout) -> manager?
  instance-exp-handler : (or/c false/c
                               (request? . -> . can-be-response?))
  instance-timeout : number?
  continuation-timeout : number?
procedure
(create-LRU-manager  instance-expiration-handler       
                     check-interval                    
                     collect-interval                  
                     collect?                          
                    [#:initial-count initial-count     
                     #:inform-p inform-p])         -> manager?
  instance-expiration-handler : (or/c false/c
                                      (request? . -> . can-be-response?))
  check-interval : integer?
  collect-interval : integer?
  collect? : (-> boolean?)
  initial-count : integer? = 1
  inform-p : (integer? . -> . void) = (lambda _ (void))
procedure
(make-threshold-LRU-manager instance-expiration-handler 
                            memory-threshold)           
 -> manager?
  instance-expiration-handler : (or/c false/c
                                      (request? . -> . can-be-response?))
  memory-threshold : number?
value
interface-version : (one-of/c 'stateless)
value
stuffer : (stuffer/c serializable? bytes?)
value
manager : manager?
procedure
(start initial-request) -> response?
  initial-request : request?
procedure
(call-with-serializable-current-continuation response-generator)
 -> any
  response-generator : (continuation? . -> . any)
syntax
(serial->native expr)
syntax
(native->serial expr)
syntax
(define-native (native arg-spec ...) original)
 
  arg-spec : ho
  arg-spec : _
procedure
(send/suspend/url response-generator) -> request?
  response-generator : (url? . -> . response?)
procedure
(send/suspend response-generator) -> request?
  response-generator : (string? . -> . response?)
procedure
(send/suspend/hidden response-generator) -> request?
  response-generator : (url? xexpr/c . -> . response?)
procedure
(send/suspend/url/dispatch make-response) -> any
  make-response : (((request? . -> . any) . -> . url?) . -> . response?)
procedure
(send/suspend/dispatch make-response) -> any
  make-response : (((request? . -> . any) . -> . string?) . ->
. response?)
procedure
(redirect/get [#:headers hs]) -> request?
  hs : (listof header?) = empty
procedure
(web-cell? v) -> boolean?
  v : any/c
syntax
(make-web-cell default-expr)
procedure
(web-cell-ref wc) -> any/c
  wc : web-cell?
procedure
(web-cell-shadow wc v) -> void
  wc : web-cell?
  v : any/c
procedure
(file-box? v) -> boolean?
  v : any/c
procedure
(file-box p v) -> file-box?
  p : path-string?
  v : serializable?
procedure
(file-unbox fb) -> serializable?
  fb : file-box?
procedure
(file-box-set? fb) -> boolean?
  fb : file-box?
procedure
(file-box-set! fb v) -> void
  fb : file-box?
  v : serializable?
syntax
(make-web-parameter default)
procedure
(web-parameter? v) -> boolean?
  v : any/c
syntax
(web-parameterize ([web-parameter-expr value-expr] ...) expr ...)
procedure
(soft-state? v) -> boolean?
  v : any/c
procedure
(make-soft-state thnk) -> soft-state?
  thnk : (-> any/c)
procedure
(soft-state-ref ss) -> any/c
  ss : soft-state?
syntax
(soft-state expr ...)
struct
(struct stuffer (in out)
    #:extra-constructor-name make-stuffer)
  in : (any/c . -> . any/c)
  out : (any/c . -> . any/c)
procedure
(stuffer/c dom rng) -> contract?
  dom : any/c
  rng : any/c
value
id-stuffer : (stuffer/c any/c any/c)
procedure
(stuffer-compose g f) -> (stuffer/c any/c any/c)
  g : (stuffer/c any/c any/c)
  f : (stuffer/c any/c any/c)
procedure
(stuffer-sequence f g) -> (stuffer/c any/c any/c)
  f : (stuffer/c any/c any/c)
  g : (stuffer/c any/c any/c)
procedure
(stuffer-if c f) -> (stuffer/c bytes? bytes?)
  c : (bytes? . -> . boolean?)
  f : (stuffer/c bytes? bytes?)
procedure
(stuffer-chain x ...) -> stuffer?
  x : (or/c stuffer? (bytes? . -> . boolean?))
value
serialize-stuffer : (stuffer/c serializable? bytes?)
value
base64-stuffer : (stuffer/c bytes? bytes?)
value
gzip-stuffer : (stuffer/c bytes? bytes?)
struct
(struct store (write read)
    #:extra-constructor-name make-store)
  write : (bytes? bytes? . -> . void)
  read : (bytes? . -> . bytes?)
procedure
(dir-store root) -> store?
  root : path-string?
value
hash-fun/c : contract?
procedure
(hash-stuffer H store) -> (stuffer/c bytes? bytes?)
  H : hash-fun/c
  store : store?
procedure
(md5-stuffer root) -> (stuffer/c bytes? bytes?)
  root : path-string?
procedure
(HMAC-SHA1 kb db) -> bytes?
  kb : bytes?
  db : bytes?
procedure
(HMAC-SHA1-stuffer kb) -> (stuffer/c bytes? bytes?)
  kb : bytes?
procedure
(is-url-too-big? v) -> boolean?
  v : bytes?
procedure
(make-default-stuffer root) -> (stuffer/c serializable? bytes?)
  root : path-string?
value
default-stuffer : (stuffer/c serializable? bytes?)
struct
(struct header (field value)
    #:extra-constructor-name make-header)
  field : bytes?
  value : bytes?
procedure
(headers-assq id heads) -> (or/c false/c header?)
  id : bytes?
  heads : (listof header?)
procedure
(headers-assq* id heads) -> (or/c false/c header?)
  id : bytes?
  heads : (listof header?)
struct
(struct binding (id)
    #:extra-constructor-name make-binding)
  id : bytes?
struct
(struct binding:form binding (value)
    #:extra-constructor-name make-binding:form)
  value : bytes?
struct
(struct binding:file binding (filename headers content)
    #:extra-constructor-name make-binding:file)
  filename : bytes?
  headers : (listof header?)
  content : bytes?
procedure
(binding:file/port-in binding) -> input-port?
  binding : binding:file/port?
procedure
(binding:file/port? v) -> boolean?
  v : any/c
procedure
(make-binding:file/port id              
                        filename        
                        headers         
                        content-in) -> binding:file/port?
  id : bytes?
  filename : bytes?
  headers : (listof header?)
  content-in : input-port?
procedure
(bindings-assq id binds) -> (or/c false/c binding?)
  id : bytes?
  binds : (listof binding?)
procedure
(bindings-assq-all id binds) -> (listof binding?)
  id : bytes?
  binds : (listof binding?)
struct
(struct request (method
                 uri
                 headers/raw
                 bindings/raw-promise
                 post-data/raw
                 host-ip
                 host-port
                 client-ip)
    #:extra-constructor-name make-request)
  method : bytes?
  uri : url?
  headers/raw : (listof header?)
  bindings/raw-promise : (promise/c (listof binding?))
  post-data/raw : (or/c #f bytes?)
  host-ip : string?
  host-port : number?
  client-ip : string?
procedure
(request-bindings/raw r) -> (listof binding?)
  r : request?
procedure
(request-bindings req)
 -> (listof (or/c (cons/c symbol? string?)
                  (cons/c symbol? bytes?)))
  req : request?
procedure
(request-headers req) -> (listof (cons/c symbol? string?))
  req : request?
procedure
(extract-binding/single id binds) -> string?
  id : symbol?
  binds : (listof (cons/c symbol? string?))
procedure
(extract-bindings id binds) -> (listof string?)
  id : symbol?
  binds : (listof (cons/c symbol? string?))
procedure
(exists-binding? id binds) -> boolean?
  id : symbol?
  binds : (listof (cons/c symbol? string))
struct
(struct response (code message seconds mime headers output))
  code : response-code/c
  message : bytes?
  seconds : real?
  mime : (or/c #f bytes?)
  headers : (listof header?)
  output : (output-port? . -> . any)
value
response-code/c : flat-contract? = (integer-in 100 999)
procedure
(response/full code        
               message     
               seconds     
               mime        
               headers     
               body)   -> response?
  code : response-code/c
  message : (or/c #f bytes?)
  seconds : real?
  mime : (or/c #f bytes?)
  headers : (listof header?)
  body : (listof bytes?)
procedure
(response/output  output                    
                 [#:code code               
                  #:message message         
                  #:seconds seconds         
                  #:mime-type mime-type     
                  #:headers headers])   -> response?
  output : (-> output-port? any)
  code : number? = 200
  message : (or/c false/c bytes?) = #f
  seconds : number? = (current-seconds)
  mime-type : (or/c bytes? #f) = TEXT/HTML-MIME-TYPE
  headers : (listof header?) = '()
value
TEXT/HTML-MIME-TYPE : bytes?
value
APPLICATION/JSON-MIME-TYPE : bytes?
procedure
(make-cookie  name                        
              value                       
             [#:comment comment           
              #:domain domain             
              #:max-age max-age           
              #:path path                 
              #:expires expires           
              #:secure? secure?           
              #:http-only? http-only?     
              #:extension extension]) -> cookie?
  name : cookie-name?
  value : cookie-value?
  comment : any/c = #f
  domain : (or/c domain-value? #f) = #f
  max-age : (or/c (and/c integer? positive?) #f) = #f
  path : (or/c path/extension-value? #f) = #f
  expires : (or/c date? string? #f) = #f
  secure? : any/c = #f
  http-only? : any/c = #f
  extension : (or/c path/extension-value? #f) = #f
procedure
(cookie->header c) -> header?
  c : cookie?
procedure
(make-id-cookie  name                        
                 value                       
                 #:key secret-salt           
                [#:path path                 
                 #:expires expires           
                 #:max-age max-age           
                 #:domain domain             
                 #:secure? secure?           
                 #:http-only? http-only?     
                 #:extension extension]) -> cookie?
  name : cookie-name?
  value : cookie-value?
  secret-salt : bytes?
  path : (or/c path/extension-value? #f) = #f
  expires : (or/c date? #f) = #f
  max-age : (or/c (and/c integer? positive?) #f) = #f
  domain : (or/c domain-value? #f) = #f
  secure? : any/c = #f
  http-only? : any/c = #f
  extension : (or/c path/extension-value? #f) = #f
(make-id-cookie  name                        
                 secret-salt                 
                 value                       
                [#:path path                 
                 #:expires expires           
                 #:max-age max-age           
                 #:domain domain             
                 #:secure? secure?           
                 #:http-only? http-only?     
                 #:extension extension]) -> cookie?
  name : cookie-name?
  secret-salt : bytes?
  value : cookie-value?
  path : (or/c path/extension-value? #f) = #f
  expires : (or/c date? #f) = #f
  max-age : (or/c (and/c integer? positive?) #f) = #f
  domain : (or/c domain-value? #f) = #f
  secure? : any/c = #f
  http-only? : any/c = #t
  extension : (or/c path/extension-value? #f) = #f
procedure
(request-id-cookie  request                   
                    #:name name               
                    #:key secret-salt         
                   [#:timeout timeout         
                    #:shelf-life shelf-life]) 
 -> (or/c #f (and/c string? cookie-value?))
  request : request?
  name : cookie-name?
  secret-salt : bytes?
  timeout : real? = +inf.0
  shelf-life : real? = +inf.0
(request-id-cookie  name                      
                    secret-salt               
                    request                   
                   [#:timeout timeout         
                    #:shelf-life shelf-life]) 
 -> (or/c #f (and/c string? cookie-value?))
  name : cookie-name?
  secret-salt : bytes?
  request : request?
  timeout : real? = +inf.0
  shelf-life : real? = +inf.0
procedure
(valid-id-cookie?  cookie                    
                   #:name name               
                   #:key secret-salt         
                  [#:timeout timeout         
                   #:shelf-life shelf-life]) 
 -> (or/c #f (and/c string? cookie-value?))
  cookie : any/c
  name : cookie-name?
  secret-salt : bytes?
  timeout : real? = +inf.0
  shelf-life : real? = +inf.0
procedure
(logout-id-cookie  name                  
                  [#:path path           
                   #:domain domain]) -> cookie?
  name : cookie-name?
  path : (or/c #f string?) = #f
  domain : (or/c domain-value? #f) = #f
procedure
(make-secret-salt/file secret-salt-path) -> bytes?
  secret-salt-path : path-string?
struct
(struct client-cookie (name value domain path)
    #:extra-constructor-name make-client-cookie)
  name : (and/c string? cookie-name?)
  value : (and/c string? cookie-value?)
  domain : (or/c #f domain-value?)
  path : (or/c #f path/extension-value?)
procedure
(request-cookies req) -> (listof client-cookie?)
  req : request?
procedure
(redirect-to uri [status #:headers headers]) -> response?
  uri : non-empty-string?
  status : redirection-status? = temporarily
  headers : (listof header?) = '()
procedure
(redirection-status? v) -> boolean?
  v : any/c
value
temporarily : redirection-status?
value
temporarily/same-method : redirection-status?
value
see-other : redirection-status?
value
permanently : redirection-status?
procedure
(make-basic-auth-header realm) -> header?
  realm : string?
procedure
(request->basic-credentials req)
 -> (or/c false/c (cons/c bytes? bytes?))
  req : request?
procedure
(make-digest-auth-header realm           
                         private-key     
                         opaque)     -> header?
  realm : string?
  private-key : string?
  opaque : string?
procedure
(request->digest-credentials req)
 -> (or/c false/c (listof (cons/c symbol? string?)))
  req : request?
value
username*realm->password/c : contract?
value
username*realm->digest-HA1/c : contract?
procedure
(password->digest-HA1 lookup-password)
 -> username*realm->digest-HA1/c
  lookup-password : username*realm->password/c
procedure
(make-check-digest-credentials lookup-HA1)
 -> (string? (listof (cons/c symbol? string?)) . -> . boolean?)
  lookup-HA1 : username*realm->digest-HA1/c
procedure
(response/xexpr  xexpr                     
                [#:code code               
                 #:message message         
                 #:seconds seconds         
                 #:mime-type mime-type     
                 #:headers headers         
                 #:cookies cookies         
                 #:preamble preamble]) -> response?
  xexpr : xexpr/c
  code : response-code/c = 200
  message : (or/c #f bytes?) = #f
  seconds : real? = (current-seconds)
  mime-type : (or/c #f bytes?) = TEXT/HTML-MIME-TYPE
  headers : (listof header?) = empty
  cookies : (listof cookie?) = empty
  preamble : bytes? = #""
procedure
(response/empty [#:code code             
                 #:message message       
                 #:cookies cookies       
                 #:seconds seconds       
                 #:headers headers]) -> response?
  code : number? = 204
  message : (or/c false/c bytes?) = #f
  cookies : (listof cookie?) = '()
  seconds : number? = (current-seconds)
  headers : (listof header?) = '()
procedure
(response/jsexpr  jsexpr                    
                 [#:code code               
                  #:message message         
                  #:seconds seconds         
                  #:mime-type mime-type     
                  #:headers headers         
                  #:cookies cookies])   -> response?
  jsexpr : jsexpr?
  code : response-code/c = 200
  message : (or/c #f bytes?) = #f
  seconds : real? = (current-seconds)
  mime-type : (or/c #f bytes?) = APPLICATION/JSON-MIME-TYPE
  headers : (listof header?) = empty
  cookies : (listof cookie?) = empty
syntax
(dispatch-rules
 dispatch-clause ...
 maybe-else-clause)
 
  dispatch-clause = [dispatch-pattern maybe-method dispatch-fun]
                     
 dispatch-pattern = ()
                  | (string . dispatch-pattern)
                  | (bidi-match-expander ... . dispatch-pattern)
                  | (bidi-match-expander . dispatch-pattern)
                     
     maybe-method = 
                  | #:method method
                     
           method = pat
                     
maybe-else-clause = 
                  | [else else-fun]
 
  else-fun : (request? . -> . any)
  dispatch-fun : (request? any/c ... . -> . any)
syntax
(dispatch-rules+applies
 dispatch-clause ...
 maybe-else-clause)
syntax
(dispatch-case
 dispatch-clause ...
 maybe-else-clause)
syntax
(dispatch-url
 [dispatch-pattern dispatch-fun]
 ...)
 
  dispatch-fun : (request? any/c ... . -> . any)
procedure
(serve/dispatch dispatch) -> void
  dispatch : (request? . -> . can-be-response?)
procedure
(container? x) -> boolean?
  x : any/c
syntax
(define-container container-id (dispatch-id url-id))
syntax
(dispatch-rules! container-expr [dispatch-pattern dispatch-fun] ...)
syntax
(number-arg)
syntax
(integer-arg)
syntax
(real-arg)
syntax
(string-arg)
syntax
(symbol-arg)
syntax
(define-bidi-match-expander id in-xform out-xform)
syntax
bidi-match-going-in?
syntax
(define-coercion-match-expander id test? coerce)
procedure
(make-coerce-safe? coerce) -> (any/c . -> . boolean?)
  coerce : (any/c . -> . any/c)
syntax
(formlet rendering-xexpr yields-expr)
syntax
#%#
syntax
(formlet* rendering-expr yields-expr)
syntax
=>*
value
xexpr-forest/c : contract?
procedure
(formlet/c content ...) -> contract?
  content : contract?
value
formlet*/c : contract?
procedure
(pure value) -> (formlet/c any/c)
  value : any/c
procedure
(cross f g) -> (formlet/c any/c ...)
  f : (formlet/c procedure?)
  g : (formlet/c any/c ...)
procedure
(cross* f g ...) -> (formlet/c any/c)
  f : (formlet/c (() () #:rest (listof any/c) . ->* . any/c))
  g : (formlet/c any/c)
procedure
(xml-forest r) -> (formlet/c procedure?)
  r : xexpr-forest/c
procedure
(xml r) -> (formlet/c procedure?)
  r : xexpr/c
procedure
(text r) -> (formlet/c procedure?)
  r : string?
procedure
(tag-xexpr tag attrs inner) -> (formlet/c any/c)
  tag : symbol?
  attrs : (listof (list/c symbol? string?))
  inner : (formlet/c any/c)
procedure
(formlet-display f) -> xexpr-forest/c
  f : (formlet/c any/c)
procedure
(formlet-process f r) -> any/c ...
  f : (formlet/c any/c ...)
  r : request?
procedure
(make-input render) -> (formlet/c (or/c false/c binding?))
  render : (string? . -> . xexpr/c)
procedure
(make-input* render) -> (formlet/c (listof binding?))
  render : (string? . -> . xexpr/c)
procedure
(input  #:type type             
       [#:value value           
        #:size size             
        #:max-length max-length 
        #:read-only? read-only? 
        #:attributes attrs])    
 -> (formlet/c (or/c false/c binding?))
  type : string?
  value : (or/c false/c bytes? string?) = #f
  size : (or/c false/c exact-nonnegative-integer?) = #f
  max-length : (or/c false/c exact-nonnegative-integer?) = #f
  read-only? : boolean? = #f
  attrs : (listof (list/c symbol? string?)) = empty
procedure
(text-input [#:value value           
             #:size size             
             #:max-length max-length 
             #:read-only? read-only? 
             #:attributes attrs])    
 -> (formlet/c (or/c false/c binding?))
  value : (or/c false/c bytes? string?) = #f
  size : (or/c false/c exact-nonnegative-integer?) = #f
  max-length : (or/c false/c exact-nonnegative-integer?) = #f
  read-only? : boolean? = #f
  attrs : (listof (list/c symbol? string?)) = empty
procedure
(password-input [#:value value           
                 #:size size             
                 #:max-length max-length 
                 #:read-only? read-only? 
                 #:attributes attrs])    
 -> (formlet/c (or/c false/c binding?))
  value : (or/c false/c bytes? string?) = #f
  size : (or/c false/c exact-nonnegative-integer?) = #f
  max-length : (or/c false/c exact-nonnegative-integer?) = #f
  read-only? : boolean? = #f
  attrs : (listof (list/c symbol? string?)) = empty
procedure
(textarea-input [#:value value        
                 #:rows rows          
                 #:cols cols          
                 #:attributes attrs]) 
 -> (formlet/c (or/c false/c binding?))
  value : (or/c false/c bytes? string?) = #f
  rows : (or/c false/c number?) = #f
  cols : (or/c false/c number?) = #f
  attrs : (listof (list/c symbol? string?)) = empty
procedure
(checkbox value checked? [#:attributes attrs])
 -> (formlet/c (or/c false/c binding?))
  value : (or/c bytes? string?)
  checked? : boolean?
  attrs : (listof (list/c symbol? string?)) = empty
procedure
(radio value checked? [#:attributes attrs])
 -> (formlet/c (or/c false/c binding?))
  value : (or/c bytes? string?)
  checked? : boolean?
  attrs : (listof (list/c symbol? string?)) = empty
procedure
(radio-group  l                       
             [#:attributes attrs      
              #:checked? checked?     
              #:display display       
              #:wrap wrap])       -> (formlet/c any/c)
  l : sequence?
  attrs : (any/c . -> . (listof (list/c symbol? string?)))
        = (λ (x) empty)
  checked? : (any/c . -> . boolean?) = (λ (x) #f)
  display : (any/c . -> . xexpr/c) = (λ (x) x)
  wrap : (any/c any/c . -> . xexpr/c) = (λ (x y) (list x y))
procedure
(checkbox-group  l                   
                [#:attributes attrs  
                 #:checked? checked? 
                 #:display display]) 
 -> (formlet/c (listof any/c))
  l : sequence?
  attrs : (any/c . -> . (listof (list/c symbol? string?)))
        = (λ (x) empty)
  checked? : (any/c . -> . boolean?) = (λ (x) #f)
  display : (any/c . -> . xexpr/c) = (λ (x) x)
procedure
(submit value [#:attributes attrs])
 -> (formlet/c (or/c false/c binding?))
  value : (or/c bytes? string?)
  attrs : (listof (list/c symbol? string?)) = empty
procedure
(reset value [#:attributes attrs])
 -> (formlet/c (or/c false/c binding?))
  value : (or/c bytes? string?)
  attrs : (listof (list/c symbol? string?)) = empty
procedure
(file-upload [#:attributes attrs])
 -> (formlet/c (or/c false/c binding?))
  attrs : (listof (list/c symbol? string?)) = empty
procedure
(hidden value [#:attributes attrs])
 -> (formlet/c (or/c false/c binding?))
  value : (or/c bytes? string?)
  attrs : (listof (list/c symbol? string?)) = empty
procedure
(img  alt                      
      src                      
     [#:height height          
      #:longdesc ldesc         
      #:usemap map             
      #:width width            
      #:attributes attrs]) -> (formlet/c (or/c false/c binding?))
  alt : (or/c bytes? string?)
  src : (or/c bytes? string?)
  height : (or/c false/c exact-nonnegative-integer?) = #f
  ldesc : (or/c false/c bytes? string?) = #f
  map : (or/c false/c bytes? string?) = #f
  width : (or/c false/c exact-nonnegative-integer?) = #f
  attrs : (listof (list/c symbol? string?)) = empty
procedure
(button  type                 
         button-text          
        [#:disabled disabled  
         #:value value        
         #:attributes attrs]) 
 -> (formlet/c (or/c false/c binding?))
  type : (or/c bytes? string?)
  button-text : (or/c bytes? string?)
  disabled : boolean? = #f
  value : (or/c false/c bytes? string?) = #f
  attrs : (listof (list/c symbol? string?)) = empty
procedure
(multiselect-input  l                         
                   [#:attributes attrs        
                    #:multiple? multiple?     
                    #:selected? selected?     
                    #:display display])   -> (formlet/c list?)
  l : sequence?
  attrs : (listof (list/c symbol? string?)) = empty
  multiple? : boolean? = #t
  selected? : (any/c . -> . boolean?) = (λ (x) #f)
  display : (any/c . -> . xexpr/c) = (λ (x) x)
procedure
(select-input  l                         
              [#:attributes attrs        
               #:selected? selected?     
               #:display display])   -> (formlet/c any/c)
  l : sequence?
  attrs : (listof (list/c symbol? string?)) = empty
  selected? : (any/c . -> . boolean?) = (λ (x) #f)
  display : (any/c . -> . xexpr/c) = (λ (x) x)
procedure
(required f) -> (formlet/c bytes?)
  f : (formlet/c (or/c false/c binding?))
procedure
(default def f) -> (formlet/c bytes?)
  def : bytes?
  f : (formlet/c (or/c false/c binding?))
procedure
(to-string f) -> (formlet/c string?)
  f : (formlet/c bytes?)
procedure
(to-number f) -> (formlet/c number?)
  f : (formlet/c string?)
procedure
(to-symbol f) -> (formlet/c symbol?)
  f : (formlet/c string?)
procedure
(to-boolean f) -> (formlet/c boolean?)
  f : (formlet/c bytes?)
value
input-string : (formlet/c string?)
value
input-int : (formlet/c number?)
value
input-symbol : (formlet/c symbol?)
procedure
(send/formlet  f                    
              [#:method method      
               #:wrap wrapper]) -> any/c ...
  f : (formlet/c any/c ...)
  method : (or/c "GET" "POST" "get" "post") = "POST"
  wrapper : (xexpr/c . -> . xexpr/c)
          = (lambda (form-xexpr)
              `(html (head (title "Form Entry"))
                     (body ,form-xexpr)))
procedure
(embed-formlet embed/url f) -> xexpr/c
  embed/url : ((request? . -> . any) . -> . string?)
  f : (formlet/c any/c ...)
syntax
(include-template path-spec)
(include-template #:command-char command-char path-spec)
syntax
(include-template/xml path-spec)
(include-template/xml #:command-char command-char path-spec)
syntax
(in x xs e ...)
syntax
(page e ...)
syntax
embed/url
syntax
(lambda/page formals e ...)
syntax
(define/page (id . formals) e ...)
parameter
(current-request) -> request?
(current-request req) -> void?
  req : request?
value
binding-id/c : contract?
value
binding-format/c : contract?
procedure
(get-binding id [req #:format format])
 -> (or/c false/c string? bytes? binding?)
  id : binding-id/c
  req : request? = (current-request)
  format : binding-format/c = 'string
procedure
(get-bindings id [req #:format format])
 -> (listof (or/c string? bytes? binding?))
  id : binding-id/c
  req : request? = (current-request)
  format : binding-format/c = 'string
value
tester/c : contract?
procedure
(make-servlet-tester servlet) -> tester/c
  servlet : (-> request?
                can-be-response?)
procedure
(make-dispatcher-tester d) -> tester/c
  d : dispatcher/c
