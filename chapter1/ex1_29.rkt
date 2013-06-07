#lang planet neil/sicp

;; using sum as defined by the book, but adding a term to count
;; what level of call we're at
(define (sum-simp function coeff a incr b k n)
  (if (> a b)
      0
      (+ (* (coeff k n) (function a))
         (sum-simp function coeff (incr a) incr b (+ k 1) n))))

;; my implementation of Simpsons rule
(define (simpson fxn a b n)
  (define h (/ (- b a) n))
  (define (next x) (+ x h))
  ; find the k-th coeff, out of n. NB - n should be even
  (define (coeff k n) 
    (cond ((= 0 k) 1)
          ((= n k) 1)
          ((even? k) 2)
          (else 4)))
  (define (even? x) (= 0 (remainder x 2)))
  ; actually do the summation
  (* (sum-simp fxn coeff a next b 0 n)
     (/ h 3)))

(define (cube x) (* x x x))

; this gives exact results surprisingly quickly ...
(simpson cube 0.0 1.0 2)
(simpson cube 0.0 1.0 4)
(simpson cube 0.0 1.0 6)
(simpson cube 0.0 1.0 8)
(simpson cube 0.0 1.0 10)

(simpson cube 0.0 5.0 2)
(simpson cube 0.0 5.0 4)
(simpson cube 0.0 5.0 6)
(simpson cube 0.0 5.0 8)
(simpson cube 0.0 5.0 10)
