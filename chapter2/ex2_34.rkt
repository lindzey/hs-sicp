#lang racket

; code from the book
; NB - this only operates on sequences, not lists of lists
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; expects the coefficients to 
;; a_n * x^n + a_(n-1) * x^(n-1) + ... + a_0
(define (horner-eval val coeffs)
  (accumulate (lambda (x y) (+ x (* val y))) 0 coeffs))

; 1 + 3x + 5x3 + x5 at x = 2 you would evaluate
; => 79
(eq? 79 (horner-eval 2 (list 1 3 0 5 0 1)))
; 1 + x + 3x^2
; @ x=1 -> 5
(eq? 5 (horner-eval 1 (list 1 1 3)))
; @ x=2 -> 15
(eq? 15 (horner-eval 2 (list 1 1 3)))