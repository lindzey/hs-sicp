#lang racket

(require "./interval_arithmetic.rkt")

;width := (1/2) * (upper_bound - lower_bound)
(define (width interval)
  (* 0.5 (- (upper-bound interval)
            (lower-bound interval))))

;I'll be using the notation x = (x.a, x.b), y = (y.a, y.b) 
;for the lower- and upper- bounds of intervals x and y

;For addition, since x.a <= x.b and y.a <= y.b, we know that 
;x+y = (x.a + y.a, x.b + y.b)

;Thus, 
;width(x+y) = (1/2) * ((x.b+y.b) - (x.a+y.a)) = width(x) + width(y)

;For subtraction, we're guaranteed that the new interval will be 
;y-x = (y.a - x.b, y.b - x.a)
;regardless of the relative locations of x and y
;Thus, 
;Width(y-x) = (1/2) * ((y.b-x.a) - (y.a-x.b))
;           = (1/2) * ((y.b - y.a) + (x.b - x.a)) 
;           = width(x) + width(y)

; For multiplication, we have the following counter-example, where
; x y and z have the same widths, but their products have different
; widths
(define x (make-interval 1 5))
(define y (make-interval 6 10))
(define z (make-interval 11 15))
(width x)
(width y)
(width z)
(width (mul-interval x y))
(width (mul-interval x z))
(width (mul-interval y z))

; and, for division:
(width (div-interval x y))
(width (div-interval x z))
(width (div-interval y z))
