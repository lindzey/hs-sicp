#lang planet neil/sicp

(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (compose f g)
  (lambda (x)
    (f (g x))))

;; function that calls the input funcion n times
(define (repeated f n)
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))))

;; testing code 
((repeated square 2) 5)