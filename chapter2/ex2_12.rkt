#lang racket


(require (except-in "./interval_arithmetic.rkt"))

(define (make-center-percent center percent)
  (let ((margin (* center percent)))
    (make-interval (- center margin) (+ center margin))))


(define (center a)
  (/ (+ (lower-bound a) (upper-bound a))
     2.))

(define (percent a)
  (let ((cen (center a)))
    (/ (- (upper-bound a) cen)
       cen)))

;; testing code
(define a (make-interval 95 105))
(define b (make-center-percent 100 0.05))
(eq-interval? a b)
(= 0.05 (percent a))
(= 0.05 (percent b))
(= 100 (center a))
(= 100 (center b))
