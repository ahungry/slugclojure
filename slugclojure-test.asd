(in-package :cl-user)
(defpackage slugclojure-test-asd
  (:use :cl :asdf))
(in-package :slugclojure-test-asd)

(defsystem slugclojure-test
  :author "Matthew Carter"
  :license "AGPLv3"
  :depends-on (:slugclojure
               :prove)
  :components ((:module "t"
                :components
                ((:file "slugclojure"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
