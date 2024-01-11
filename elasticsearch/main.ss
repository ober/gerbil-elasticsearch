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
	     (argument 'arg1 help: "first argument to verb1")))

  (def verb2
    (command 'verb2 help: "This is verb2 help"
	     (argument 'arg1 help: "first argument to verb2")
  	     (argument 'arg2 help: "second argument to verb2")))

  (def verb3
    (command 'verb3 help: "This is verb3 help"
	     (argument 'arg1 help: "first argument to verb3")))

  (call-with-getopt es-main args
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
	(verb3-function .arg1)))))
