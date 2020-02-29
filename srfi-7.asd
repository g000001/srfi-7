;;;; srfi-7.asd

(cl:in-package :asdf)


(defsystem :srfi-7
  :version "20200301"
  :description "SRFI 7 for CL: Feature-based program configuration language"
  :long-description "SRFI 7 for CL: Feature-based program configuration language
https://srfi.schemers.org/srfi-7"
  :author "Richard Kelsey"
  :maintainer "CHIBA Masaomi"
  :serial t
  :depends-on (:mbe :srfi-0 :fiveam)
  :components ((:file "package")
               (:file "srfi-7")))


(defmethod perform :after ((o load-op) (c (eql (find-system :srfi-7))))
  (let ((name "https://github.com/g000001/srfi-7")
        (nickname :srfi-7))
    (if (and (find-package nickname)
             (not (eq (find-package nickname)
                      (find-package name))))
        (warn "~A: A package with name ~A already exists." name nickname)
        (rename-package name name `(,nickname)))))


;;; *EOF*


