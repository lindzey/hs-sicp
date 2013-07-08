#lang racket

(require (except-in "symbolic_math.rkt" exponentiation? make-exponentiation base exponent deriv))
; d(u^n)/dx = n*u^(n-1)(du/dx)
; new clause to the deriv program and defining appropriate procedures 
;exponentiation?, base, exponent, and make-exponentiation. 
;(You may use the symbol ** to denote exponentiation.) 
;Build in the rules that anything raised to the power 0 is 1 
;and anything raised to the power 1 is the thing itself.

(define (make-exponentiation base pow)
  (cond ((=number? pow 0) 1)
        ((=number? pow 1) base)
        (else (list '** base pow))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))
(define (base x) (cadr x))
(define (exponent x) (caddr x))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp)
         (make-product (make-product (exponent exp)
                                     (make-exponentiation (base exp) 
                                                          (make-sum (exponent exp) -1)))
                       (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))

(deriv '(** x 3) 'x)
(deriv '(** x (+ 3 y)) 'x)
(deriv '(** x 0) 'x)
(deriv '(** x 1) 'x)

