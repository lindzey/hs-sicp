#lang racket


;; Church numerals are really really playing with my head
 
(define zero (lambda (f) (lambda (x) x)))
(zero 1)

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
(add-1 (zero 1))
