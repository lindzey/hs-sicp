#lang planet neil/sicp

;; I"m not sure what the point of this exercise is, as it's just typing
;; in code from the book

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? test-divisor n)
  (= 0 (remainder n test-divisor)))
(define (square n) (* n n))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)