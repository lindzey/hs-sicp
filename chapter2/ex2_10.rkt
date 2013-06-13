#lang racket

(require (except-in "./interval_arithmetic.rkt" div-interval))

;; Redefining div-interval to avoid the equivalent of a 
;; divide-by-zero condition

(define (ge x y) (not (< x y)))
(define (le x y) (not (< y x)))

(define (div-interval x y)
  (if (and (ge (upper-bound y) 0)
           (le (lower-bound y) 0))
      (and (display "error: cannot divide by interval spanning 0")
           (newline))
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))


;; testing
(define x (make-interval -2 2))
(define y1 (make-interval -4 -2))
(define y2 (make-interval -4 4))
(define y3 (make-interval 2 4))
(div-interval x y1)
(div-interval x y2)
(div-interval x y3)
