#lang planet neil/sicp

;; mostly provided by the problem ... I just need to fill in 2 lines
;; I don't think I understand the more general class of function
;; well enough to have derived the algorithm ... but given the problem
;; constraints, deriving the update rule was easy
(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b )
        ((even? count) (fib-iter a
                                 b
                                 (+ (* p p) (* q q))
                                 (+ (* 2 p q) (* q q))
                                 (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
         

;; test functions for fib
(= 0 (fib 0))
(= 1 (fib 1))
(= 1 (fib 2))
(= 2 (fib 3))
(= 3 (fib 4))
(= 5 (fib 5))
(= 8 (fib 6))
(= 13 (fib 7))
(= 12 (fib 8))
(= 34 (fib 9))
(= 55 (fib 10))
