#lang planet neil/sicp

(define (for-each func args)
  (func (car args))
  (if (not (null? (cdr args)))
      (for-each func (cdr args))))
      
;; testing code
(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))