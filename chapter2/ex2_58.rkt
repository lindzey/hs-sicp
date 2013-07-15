#lang racket

(require "symbolic_math.rkt")

;; it would be really easy to do (a) with just changing the selectors
;; for (b), I chose to parse the equation first and then differentiate it
;; To answer the book's problem as stated, I'd need to move the parsing logic into 
;; the helper functions, and entirely skip the intermediate step.
;; However, in this scheme, the output is prefix notation ... 


(define (infix-add? exp)
  (eq? '+ (cadr exp)))
(define (infix-mult? exp)
  (eq? '* (cadr exp)))

(define (parse exp)
  (cond ((null? exp) exp)
        ((number? exp) exp)
        ((variable? exp) exp)
        ((null? (cdr exp)) (parse (car exp)))
        ((infix-add? exp)
         (list '+ (car exp) (parse (cddr exp))))
        ((infix-mult? exp)
         (if (null? (cdddr exp))
             (list '* (parse (car exp)) (parse (caddr exp)))
             (parse (cons (list '* (parse (car exp)) (parse (caddr exp)))
                          (cdddr exp)))))))

(define (infix-deriv exp var)
  (deriv (parse exp) var))


;; testing helper functions
(define exp1 '(x + y))
(eq? #t (infix-add? exp1))
(eq? #f (infix-mult? exp1))

(define exp2 '(x * y))
(eq? #f (infix-add? exp2))
(eq? #t (infix-mult? exp2))

;; testing parsing
(parse exp1)
(parse exp2)
(define exp3 '(x + y * z))
(parse exp3)
(define exp4 '(x + y * z + w))
(parse exp4)
(define exp5 '(x + y + 2))
(parse exp5)
(define exp6 '(3 * (x + y + 2)))
(parse exp6)
(define exp7 '(x + 3 * (x + y + 2)))
(parse exp7)
(define exp8 '(x + (3 * (x + (y + 2)))))
(parse exp8)

;; testing final derivative function
(eq? '1 (infix-deriv exp1 'x))
(eq? 'x (infix-deriv exp2 'y))
(eq? 'z (infix-deriv exp3 'y))
(eq? '1 (infix-deriv exp4 'w))
(eq? '1 (infix-deriv exp5 'y))
(eq? '3 (infix-deriv exp6 'y))
(eq? '4 (infix-deriv exp7 'x))
