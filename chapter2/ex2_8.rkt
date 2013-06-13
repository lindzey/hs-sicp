#lang racket

(require (except-in "./interval_arithmetic.rkt" sub-interval))

(define (sub-interval x y)
  (let ((l1 (- (lower-bound x) (lower-bound y)))
        (l2 (- (lower-bound x) (upper-bound y)))
        (u1 (- (upper-bound x) (lower-bound y)))
        (u2 (- (upper-bound x) (upper-bound y))))
    (make-interval (min l1 l2) (max u1 u2))))
        

;; testing code
(define a (make-interval 1 4))
(define b1 (make-interval -4 -1.5))
(define b2 (make-interval 0 2))
(define b3 (make-interval 2 3))
(define b4 (make-interval 3.5 5))
(define b5 (make-interval 4 7))
(define b6 (make-interval 5 7))

(= 2.5 (lower-bound (sub-interval a b1)))
(= 8 (upper-bound (sub-interval a b1)))
(= -1 (lower-bound (sub-interval a b2)))
(= 4 (upper-bound (sub-interval a b2)))
(= -2 (lower-bound (sub-interval a b3)))
(= 2 (upper-bound (sub-interval a b3)))
(= -4 (lower-bound (sub-interval a b4)))
(= 0.5 (upper-bound (sub-interval a b4)))
(= -6 (lower-bound (sub-interval a b5)))
(= 0 (upper-bound (sub-interval a b5)))
(= -6 (lower-bound (sub-interval a b6)))
(= -1 (upper-bound (sub-interval a b6)))