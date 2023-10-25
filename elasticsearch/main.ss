;;; -*- Gerbil -*-
(import :std/error
        :std/sugar
        :std/getopt
        ./lib)
(export main)

;; build manifest; generated during the build
;; defines version-manifest which you can use for exact versioning
(include "../manifest.ss")

(def (main . args)
  (def verb1
    (command 'verb1 help: "This is verb1 help"
	     (rest-arguments 'arg1 help: "first argument to verb1")))

  (call-with-getopt gxpkg-main args
    program: "elasticsearch"
    help: "Elasticsearch cli in Gerbil"
    verb1
    verb2
    verb3))

(def (es-main cmd opt)
  (let-hash opt
    (case cmd
      ((verb1)
       (verb1-function .arg1))
      ((verb2)
	(verb2-function .arg1 .arg2))
      ((verb3)
	(verb3-function .arg1 .arg2 .arg3)))))
