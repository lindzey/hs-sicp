#lang planet neil/sicp

;; handle ^0 here, before calling helper function
(define (exp b n)
  (cond ((= n 0) 1)
        (else (exp-helper b n 1 b))))
;; the loop invariant here is that p = b^m
;; at output, we want n = m
(define (exp-helper b n m p)
  (cond ((= n m) p)
        ((can-double? n m) (exp-helper b n (* m 2) (* p p)))
        (else (exp-helper b n (+ m 1) (* b p)))))
(define (can-double? n m)
  (not (< n (* 2 m))))

;; test functions for b ^ n
(= 1 (exp 2 0))
(= 2 (exp 2 1))
(= 4 (exp 2 2))
(= 8 (exp 2 3))
(= 16 (exp 2 4))
(= 32 (exp 2 5))
(= 64 (exp 2 6))
(= 128 (exp 2 7))
(= 256 (exp 2 8))
(= 1 (exp 3 0))
(= 3 (exp 3 1))
(= 9 (exp 3 2))
(= 27 (exp 3 3))
(= 81 (exp 3 4))
(= 1 (exp 4 0))
(= 4 (exp 4 1))
(= 16 (exp 4 2))
(= 64 (exp 4 3))
(= 1 (exp 5 0))
(= 5 (exp 5 1))
(= 25 (exp 5 2))
(= 125 (exp 5 3))
(= 625 (exp 5 4))
