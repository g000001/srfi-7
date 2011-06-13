;;;; srfi-7.lisp

(cl:in-package :srfi-7-internal)

(def-suite srfi-7)

(in-suite srfi-7)

(define-syntax program
  (syntax-rules (requires files systems code feature-cond)
    ((program)
     (progn))
    ((program (requires feature-id ***)
              more ***)
     (progn (cond-expand ((and feature-id ***) :okay))
            (program more ***)))
    ((program (files filename ***)
              more ***)
     (progn (load filename) ***
            (program more ***)))
    ((program (systems systemname ***)
              more ***)
     (progn (asdf:load-system systemname) ***
            (program more ***)))
    ((program (code stuff ***)
              more ***)
     (progn stuff ***
            (program more ***)))
    ((program (feature-cond (requirement stuff ***) ***)
              more ***)
     (progn (cond-expand (requirement (program stuff ***)) ***)
            (program more ***)))))
