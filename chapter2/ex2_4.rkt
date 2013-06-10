#lang planet neil/sicp

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))
(define (cdr z) (z (lambda (p q) q)))

;; this works b/c cons returns a procedure that operates on yet another procedure, 
;; passing it x and y as bound variables. Then, to access the 1st/2nd parts of the 
;; pair, we just need a procedure that returns the first or second bound variable.

;; testing code
(define foo (cons 1 2))
(car foo)
(cdr foo)

;; using the substitution model
(define bar (cons 1 2))
(lambda (m) (m 1 2))
(cdr bar)
(cdr (lambda (m) (m 1 2)))
((lambda (m) (m 1 2)) (lambda (p q) q))
((lambda (p q) q) 1 2)
2     