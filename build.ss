#!/usr/bin/env gxi
;;; -*- Gerbil -*-
(import :std/build-script)

(defbuild-script
  '("elasticsearch/lib"
    (exe: "elasticsearch/main" bin: "elasticsearch")))
