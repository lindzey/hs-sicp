#lang racket

; make-vect and corresponding selectors xcor-vect and ycor-vect. 
; In terms of your selectors and constructor, implement procedures add-vect, 
; sub-vect, and scale-vect 

(define (make-vect xx yy) (list xx yy))
(define (xcor-vect vect) (car vect))
(define (ycor-vect vect) (cadr vect))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2)) 
             (+ (ycor-vect v1) (ycor-vect v2))))
(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2)) 
             (- (ycor-vect v1) (ycor-vect v2))))
(define (scale-vect s v1)
  (make-vect (* s (xcor-vect v1))
             (* s (ycor-vect v1))))

(define v1 (make-vect 1 2))
(define v2 (make-vect 3 4))
(eq? 1 (xcor-vect v1))
(eq? 2 (ycor-vect v1))
(eq? 4 (xcor-vect (add-vect v1 v2)))
(eq? 6 (ycor-vect (add-vect v1 v2)))
(eq? -2 (xcor-vect (sub-vect v1 v2)))
(eq? -2 (ycor-vect (sub-vect v1 v2)))

             