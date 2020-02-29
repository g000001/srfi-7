;;;; package.lisp

(cl:in-package :cl-user)


(defpackage "https://github.com/g000001/srfi-7"
  (:use)
  (:export program
           requires
           files
           code
           feature-cond
           systems))


(defpackage "https://github.com/g000001/srfi-7#internals"
  (:use "https://github.com/g000001/srfi-7"
        "https://github.com/g000001/srfi-0"
        cl
        mbe))


;;; *EOF*
