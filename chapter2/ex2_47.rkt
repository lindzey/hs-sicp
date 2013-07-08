#lang racket

(require "../utils.rkt")

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))
(define (edge1-frame frame)
  (cadr frame))
(define (edge2-frame frame)
  (cadr (cdr frame)))
  
(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame2 frame)
  (car frame))
(define (edge1-frame2 frame)
  (car (cdr frame)))
(define (edge2-frame2 frame)
  (cdr (cdr frame)))


;; from the book
(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

;; testing code
(define frame1 (make-frame (make-vect 1 1) (make-vect 1 1) (make-vect -1 1)))
(origin-frame frame1)
(edge1-frame frame1)
(edge2-frame frame1)

(define frame2 (make-frame2 (make-vect 1 1) (make-vect 0 1) (make-vect 1 0)))
(origin-frame2 frame2)
(edge1-frame2 frame2)
(edge2-frame2 frame2)