#lang racket

(require (except-in "./interval_arithmetic.rkt" mul-interval))


(define (neg-interval x)
  (and (< (lower-bound x) 0)
       (< (upper-bound x) 0)))
(define (pos-interval x)
  (and (ge (lower-bound x) 0)
       (ge (upper-bound x) 0)))
(define (zero-interval x)
  (and (< (lower-bound x) 0)
       (ge (upper-bound x) 0)))

;; testing these
(define x (make-interval -4 -2))
(define y (make-interval -2 2))
(define z (make-interval 2 4))
(display "testing negative interval")
(newline)
(neg-interval x)
(zero-interval x)
(pos-interval x)
(display "testing a zero-spanning interval")
(newline)
(neg-interval y)
(zero-interval y)
(pos-interval y)
(display "testing positive interval")
(newline)
(neg-interval z)
(zero-interval z)
(pos-interval z)

(define (mul-interval x y)
  (cond ((and (neg-interval x) (neg-interval y))
         (make-interval (* (upper-bound x) (upper-bound y))
                        (* (lower-bound x) (lower-bound y))))
        ((and (neg-interval x) (zero-interval y))
         (make-interval (* (lower-bound x) (upper-bound y))
                        (* (lower-bound x) (lower-bound y))))
        
             
;; testing that mul-interval2 has same results as mul-interval
;; old version from book for comparison purposes
(define (mul-interval-old x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(= (mul-interval x x) (mul-interval-old x x))
(= (mul-interval x y) (mul-interval-old x y))
(= (mul-interval x z) (mul-interval-old x z))

(= (mul-interval y x) (mul-interval-old y x))
(= (mul-interval y y) (mul-interval-old y y))
(= (mul-interval y z) (mul-interval-old y z))

(= (mul-interval z x) (mul-interval-old z x))
(= (mul-interval z y) (mul-interval-old z y))
(= (mul-interval z z) (mul-interval-old z z))
