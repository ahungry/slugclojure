(ql:quickload :slugclojure)

(defpackage slugclojure.app
  (:use :cl)
  (:import-from :lack.builder
                :builder)
  (:import-from :ppcre
                :scan
                :regex-replace)
  (:import-from :slugclojure.web
                :*web*)
  (:import-from :slugclojure.config
                :config
                :productionp
                :*static-directory*))
(in-package :slugclojure.app)

(builder
 (:static
  :path (lambda (path)
          (if (ppcre:scan "^(?:/images/|/third_party/|/css/|/js/|/robot\\.txt$|/favicon\\.ico$)" path)
              path
              nil))
  :root *static-directory*)
 (if (productionp)
     nil
     :accesslog)
 (if (getf (config) :error-log)
     '(:backtrace
       :output (getf (config) :error-log))
     nil)
 :session
 (if (productionp)
     nil
     (lambda (app)
       (lambda (env)
         (let ((datafly:*trace-sql* t))
           (funcall app env)))))
 *web*)
