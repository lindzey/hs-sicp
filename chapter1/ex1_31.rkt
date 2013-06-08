#lang planet neil/sicp

;; product analogous to sum
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

;; testing product:
(define (inc x) (+ x 1))
(define (iden x) x)
(= 2 (product iden 1 inc 2))
(= 6 (product iden 1 inc 3))
(= 24 (product iden 1 inc 4))
(= 120 (product iden 1 inc 5))
(= 720 (product iden 1 inc 6))

;; writing factorial in terms of product
(define (factorial n)
  (if (not (< 0 n))
      0
      (product iden 1 inc n)))
(= 0 (factorial 0))
(= 1 (factorial 1))
(= 2 (factorial 2))
(= 6 (factorial 3))
(= 24 (factorial 4))
(= 120 (factorial 5))
(= 720 (factorial 6))

;; approximating pi/4 using product
(define (even? n) 
  (= 0 (remainder n 2)))
(define (num n)
  (if (even? n) 
      (+ n 2)
      (+ n 1)))
(define (den n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))
(define (term n) 
    (/ (num n) (den n)))
(define (pi4 n)
  (product term 1. inc n))

; actual value is 0.7853981633974483
(pi4 1)
(pi4 2)
(pi4 5)
(pi4 10)
(pi4 100)
(pi4 1000)
(pi4 10000)

;;;;;;; part b - my original product alg was an iterative process, now writing
;;; one that's recursive

;; product analogous to sum
(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a) (product-rec term (next a) next b))))

; testing product:
(= 2 (product-rec iden 1 inc 2))
(= 6 (product-rec iden 1 inc 3))
(= 24 (product-rec iden 1 inc 4))
(= 120 (product-rec iden 1 inc 5))
(= 720 (product-rec iden 1 inc 6))