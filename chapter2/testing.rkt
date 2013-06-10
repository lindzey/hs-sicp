#lang racket

;(require make-point)
(require "ex2_2.rkt")

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
