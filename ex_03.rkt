#lang planet neil/sicp

;; function that takes 3 args, returns sum of squares of two larger ones
;; My approach is to test whether x y or z is smallest, 
;; then call it on the other two
(define (sum-largest-squares x y z) 
  (cond ((and (<= x y) (<= x z)) (sum-squares y z)) ;; x smallest
        ((and (<= y x) (<= y z)) (sum-squares x z)) ;; y smallest
        (else (sum-squares x y)))) ;; z smallest
(define (<= x y) (not (> x y)))
  

;; function that returns the sum of squares of two numbers
(define (sum-squares x y) (+ (square x) (square y)))

;; function that squares a number
(define (square x) (* x x))

;; Test scripts for the above function - every one should eval to #t
(= 9 (square 3))
(= 0.25 (square 0.5))
(= 25 (sum-squares 3 4))
(= 136 (sum-squares 10 6))
(= 25 (sum-largest-squares 2 3 4))
(= 25 (sum-largest-squares 3 2 4))
(= 25 (sum-largest-squares 4 3 2))
(<= 3 4)
(<= 4 4)
(not (<= 4 3))