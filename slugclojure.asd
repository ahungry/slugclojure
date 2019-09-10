(in-package :cl-user)
(defpackage slugclojure-asd
  (:use :cl :asdf))
(in-package :slugclojure-asd)

(defsystem slugclojure
  :version "0.1"
  :author "Matthew Carter"
  :license "AGPLv3"
  :depends-on (:clack
               :lack
               :caveman2
               :envy
               :cl-ppcre

               ;; for @route annotation
               :cl-syntax-annot

               ;; HTML Template
               :djula

               ;; for DB
               :datafly
               :sxql

               ;; misc
               :cl-json
               :3bmd
               :3bmd-ext-code-blocks
               :split-sequence
               :drakma
               :glyphs)
  :components ((:module "src"
                :components
                ((:file "main" :depends-on ("config" "view" "db" "model"))
                 (:file "web" :depends-on ("view" "model"))
                 (:file "view" :depends-on ("config"))
                 (:file "model" :depends-on ("config"))
                 (:file "db" :depends-on ("config"))
                 (:file "config"))))
  :description "Web based index of Quicklisp projects"
  :in-order-to ((test-op (load-op slugclojure-test))))
