#lang planet neil/sicp

;; iterative procedure using double/halve
(define (fast-mult a b)
  (cond ((= b 0) 0)
        (else (mult-helper a b 1 a))))
;; the loop invariant is that p = a*m
;; at termination, we want b = m
(define (mult-helper a b m p)
  (cond ((= b m) p)
        ((can-double? b m) (mult-helper a b (double m) (double p)))
        (else (mult-helper a b (+ m 1) (+ a p)))))
        
(define (can-double? b m) 
    (not (< b (* 2 m))))  
                    
; I think we're allowed to assume that we have these, and don't
; have to worry about implementing them w/o '*' and '/'
; (helper-functions and tests copied from ex1_17)
(define (double a)
  (* 2 a))
(define (halve a)
  (/ a 2))

;; test code
(= 0 (fast-mult 0 1))
(= 0 (fast-mult 0 1))
(= 1 (fast-mult 1 1))
(= 2 (fast-mult 1 2))
(= 3 (fast-mult 1 3))
(= 4 (fast-mult 1 4))
(= 5 (fast-mult 1 5))
(= 2 (fast-mult 2 1))
(= 4 (fast-mult 2 2))
(= 6 (fast-mult 2 3))
(= 8 (fast-mult 2 4))
(= 10 (fast-mult 2 5))
(= 3 (fast-mult 3 1))
(= 6 (fast-mult 3 2))
(= 9 (fast-mult 3 3))
(= 12 (fast-mult 3 4))
(= 15 (fast-mult 3 5))