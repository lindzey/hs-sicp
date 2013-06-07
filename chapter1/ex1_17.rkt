#lang planet neil/sicp

;; procedure given in the problem
(define (slow-mult a b)
  (if (= b 0)
      0
      (+ a (slow-mult a (- b 1)))))

;; recursive procedure using double/halve
(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-mult (double a) (halve b)))
        (else (+ a (fast-mult a (- b 1))))))

; I think we're allowed to assume that we have these, and don't
; have to worry about implementing them w/o '*' and '/'
(define (double a)
  (* 2 a))
(define (halve a)
  (/ a 2))
(define (even? a)
  (= 0 (remainder a 2)))

;; test code
(= 0 (slow-mult 0 1))
(= 0 (slow-mult 0 1))
(= 1 (slow-mult 1 1))
(= 2 (slow-mult 1 2))
(= 3 (slow-mult 1 3))
(= 4 (slow-mult 1 4))
(= 5 (slow-mult 1 5))
(= 2 (slow-mult 2 1))
(= 4 (slow-mult 2 2))
(= 6 (slow-mult 2 3))
(= 8 (slow-mult 2 4))
(= 10 (slow-mult 2 5))
(= 3 (slow-mult 3 1))
(= 6 (slow-mult 3 2))
(= 9 (slow-mult 3 3))
(= 12 (slow-mult 3 4))
(= 15 (slow-mult 3 5))

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