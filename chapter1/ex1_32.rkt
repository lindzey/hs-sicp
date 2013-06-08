#lang planet neil/sicp

;;; Recursive version

(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate-rec combiner null-value term (next a) next b))))

(define (sum-rec term a next b)
  (accumulate-rec + 0 term a next b))

(define (product-rec term a next b)
  (accumulate-rec * 1 term a next b))

;; testing sum and product
(define (inc x) (+ x 1))
(define (iden x) x)
(= 1 (sum-rec iden 1 inc 1))
(= 3 (sum-rec iden 1 inc 2))
(= 6 (sum-rec iden 1 inc 3))
(= 10 (sum-rec iden 1 inc 4))
(= 15 (sum-rec iden 1 inc 5))
(= 21 (sum-rec iden 1 inc 6))

(= 2 (product-rec iden 1 inc 2))
(= 6 (product-rec iden 1 inc 3))
(= 24 (product-rec iden 1 inc 4))
(= 120 (product-rec iden 1 inc 5))
(= 720 (product-rec iden 1 inc 6))

;;; Iterative version

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a current)
    (if (> a b)
        current
        (iter (next a) (combiner current (term a)))))
  (iter a null-value))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

;; testing sum and product
(= 1 (sum-iter iden 1 inc 1))
(= 3 (sum-iter iden 1 inc 2))
(= 6 (sum-iter iden 1 inc 3))
(= 10 (sum-iter iden 1 inc 4))
(= 15 (sum-iter iden 1 inc 5))
(= 21 (sum-iter iden 1 inc 6))

(= 2 (product-iter iden 1 inc 2))
(= 6 (product-iter iden 1 inc 3))
(= 24 (product-iter iden 1 inc 4))
(= 120 (product-iter iden 1 inc 5))
(= 720 (product-iter iden 1 inc 6))