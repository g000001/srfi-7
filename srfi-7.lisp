;;;; srfi-7.lisp

(cl:in-package "https://github.com/g000001/srfi-7#internals")


(define-syntax eval-always
  (syntax-rules ()
    ((_ body ***)
     (eval-when (:compile-toplevel :load-toplevel :execute)
       body ***))))


(define-syntax program
  (syntax-rules (requires files systems code feature-cond)
    ((program)
     (progn))
    ((program (requires feature-id ***)
              more ***)
     (eval-always
       (cond-expand ((and feature-id ***) :okay))
       (program more ***)))
    ((program (files filename ***)
              more ***)
     (eval-always
       (load filename) ***
       (program more ***)))
    ((program (systems systemname ***)
              more ***)
     (eval-always
       (asdf:load-system systemname) ***
       (program more ***)))
    ((program (code stuff ***)
              more ***)
     (eval-always
       stuff ***
       (program more ***)))
    ((program (feature-cond (requirement stuff ***) ***)
              more ***)
     (eval-always
       (cond-expand (requirement (program stuff ***)) ***)
       (program more ***)))))


;;; *EOF*
