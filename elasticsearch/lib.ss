;;; -*- Gerbil -*-
(import :std/error
        :std/sugar)
(export #t)

;;; Your library support code
;;; ...

(def (verb1-function arg1)
  (displayln "verb1-function with " arg1))

(def (verb2-function arg1 arg2)
  (displayln "verb1-function with " arg1 " arg2: " arg2))

(def (verb3-function arg1)
  (displayln "verb1-function with " arg1))
