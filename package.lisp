;;;; package.lisp

(cl:in-package :cl-user)

(defpackage :srfi-7
  (:use)
  (:export :program
           :requires
           :files
           :code
           :feature-cond))

(defpackage :srfi-7-internal
  (:use :srfi-7 :cl :fiveam :mbe :srfi-0))

