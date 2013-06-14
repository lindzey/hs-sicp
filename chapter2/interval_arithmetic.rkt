#lang racket

;; common code for the interval arithmetic problems in section 2.1.4

(provide add-interval)
(provide sub-interval)
(provide mul-interval)
(provide div-interval)

(provide make-interval)
(provide upper-bound)
(provide lower-bound)

(provide ge)
(provide le)
(provide eq-interval?) ; this can be dangerous due to 

;; code from the book
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

;; From exercise 2.7
(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

;; From exercise 2.8
(define (sub-interval x y)
    (make-interval (- (lower-bound x) (upper-bound y)) 
                   (- (upper-bound x) (lower-bound y))))

;; From exercise 2.10
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

;; from exercise 2.11

(define (mul-interval a b)
  (cond ((and (neg-interval a) (neg-interval b))
         (make-interval (* (upper-bound a) (upper-bound b))
                        (* (lower-bound a) (lower-bound b))))
        ((and (neg-interval a) (zero-interval b))
         (make-interval (* (lower-bound a) (upper-bound b))
                        (* (lower-bound a) (lower-bound b))))
        ((and (neg-interval a) (pos-interval b))
         (make-interval (* (lower-bound a) (upper-bound b))
                        (* (upper-bound a) (lower-bound b))))
        ((and (zero-interval a) (neg-interval b))
         (make-interval (* (upper-bound a) (lower-bound b))
                        (* (lower-bound a) (lower-bound b))))
        ((and (zero-interval a) (zero-interval b))
         (let ((p1 (* (lower-bound a) (lower-bound b)))
               (p2 (* (lower-bound a) (upper-bound b)))
               (p3 (* (upper-bound a) (lower-bound b)))
               (p4 (* (upper-bound a) (upper-bound b))))
           (make-interval (min p2 p3)
                          (max p1 p4))))
        ((and (zero-interval a) (pos-interval b))
         (make-interval (* (lower-bound a) (upper-bound b))
                        (* (upper-bound a) (upper-bound b))))
        ((and (pos-interval a) (neg-interval b))
         (make-interval (* (upper-bound a) (lower-bound b))
                        (* (lower-bound a) (upper-bound b))))
        ((and (pos-interval a) (zero-interval b))
         (make-interval (* (upper-bound a) (lower-bound b))
                        (* (upper-bound a) (upper-bound b))))
        ((and (pos-interval a) (pos-interval b))
         (make-interval (* (lower-bound a) (lower-bound b))
                        (* (upper-bound a) (upper-bound b))))))

(define (eq-interval? a b)
  (and (= (lower-bound a) (lower-bound b))
       (= (upper-bound a) (upper-bound b))))

(define (neg-interval x)
  (and (< (lower-bound x) 0)
       (< (upper-bound x) 0)))
(define (pos-interval x)
  (and (ge (lower-bound x) 0)
       (ge (upper-bound x) 0)))
(define (zero-interval x)
  (and (< (lower-bound x) 0)
       (ge (upper-bound x) 0)))
