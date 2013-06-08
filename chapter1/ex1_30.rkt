#lang planet neil/sicp

;; original sum procedure from the book

(define (rec-sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (rec-sum term (next a) next b))))

;; my freeform version
(define (iter-sum term a next b)
  (iter-helper term a next b 0))

(define (iter-helper term a next b curr)
  (if (> a b)
      curr
      (iter-helper term (next a) next b (+ curr (term a)))))
      
;; finally, following the book's template
;; This is much more elegant, since it doesn't have to pass all the 
;; non-modified vars between the sum function and the helper function
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

;; test code
(define (cube x) (* x x x))
(define (inc x) (+ x 1))
(= 3025 (rec-sum cube 1 inc 10))
(= 3025 (iter-sum cube 1 inc 10))
(= 3025 (sum cube 1 inc 10))


