#lang racket

;; common code for the interval arithmetic problems in section 2.1.4

(provide add-interval)
(provide sub-interval)
(provide mul-interval)
(provide div-interval)

(provide make-interval)
(provide upper-bound)
(provide lower-bound)

;; code from the book
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))


;; From exercise 2.7
(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

;; From exercise 2.8
(define (sub-interval x y)
  (let ((l1 (- (lower-bound x) (lower-bound y)))
        (l2 (- (lower-bound x) (upper-bound y)))
        (u1 (- (upper-bound x) (lower-bound y)))
        (u2 (- (upper-bound x) (upper-bound y))))
    (make-interval (min l1 l2) (max u1 u2))))
        
