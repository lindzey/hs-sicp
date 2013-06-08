#lang planet neil/sicp

;; showing that the golden ratio is a fixed point of 1 + 1/x
(define gr (/ (+ 1 (sqrt 5)) 2))
gr
((lambda (x) (+ 1 (/ 1 x))) gr)

;; fixed-point procedure from the book
(define (fixed-point f x)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
          next
          (try next))))
  (try x))
          
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
