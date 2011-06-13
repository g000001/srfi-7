;;;; srfi-7.asd

(cl:in-package :asdf)

(defsystem :srfi-7
  :serial t
  :depends-on (:mbe :srfi-0 :asdf)
  :components ((:file "package")
               (:file "srfi-7")))

(defmethod perform ((o test-op) (c (eql (find-system :srfi-7))))
  (load-system :srfi-7)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
         (let ((result (funcall (_ :fiveam :run) (_ :srfi-7-internal :srfi-7))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))

