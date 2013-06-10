#lang racket

;; representing a line segment in a plane 
; awfully similar to the make-rat procedure ...
(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))
(define (print-point point)
  (newline)
  (display "(")
  (display (x-point point))
  (display ", ")
  (display (y-point point))
  (display ")"))
(define (average x y)
  (/ (+ x y) 2))
(define (avg-pts p1 p2)
  (make-point (average (x-point p1) (x-point p2))
              (average (y-point p1) (y-point p2))))

;; assumes p and q are points
;; NB - line segments as implemented here are *directional* I'm not sure if that's 
;;      desired or not, but won't matter for this exercise
(define (make-segment p q)
  (cons p q))
(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))
(define (midpoint-segment seg)
  (avg-pts (start-segment seg) (end-segment seg)))

;; testing code 
(define p1 (make-point 0 0))
(define p2 (make-point 3 3))
(define p3 (make-point 1 2))

;; midpoint of this segment should be (1.5 1.5)
(define seg1 (make-segment p1 p2))
(print-point (midpoint-segment seg1))
;; midpoint of this segment should be (0.5 1)
(define seg2 (make-segment p1 p3))
(print-point (midpoint-segment seg2))
;; midpoint of this segment should be (2 2.5)
(define seg3 (make-segment p2 p3))
(print-point (midpoint-segment seg3))

