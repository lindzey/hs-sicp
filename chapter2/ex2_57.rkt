#lang racket

(require (except-in "symbolic_math.rkt" augend  multiplicand deriv))
                   
                    
(define (augend s) 
  (if (null? (cdddr s))
         (caddr s)
         (cons '+ (cddr s))))

(define (multiplicand p) 
  (if (null? (cdddr p))
      (caddr p)
      (cons '* (cddr p))))

;; hasn't changed, but need to redefine it here to use the correct versions
;; of augend and multiplicand
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



(define expr1 '(+ 1 2))
(eq? 1 (addend expr1))
(eq? 2(augend expr1))
(define expr2 '(+ 1 2 3))
(eq? 1 (addend expr2))
(eq? 2 (addend (augend expr2)))
(eq? 3 (augend (augend expr2)))

(eq? 1 (deriv '(+ x 3) 'x))
(eq? 2(deriv '(+ x 3 x) 'x))

(define expr3 '(* 1 2))
(eq? 1 (multiplier expr3))
(eq? 2(multiplicand expr3))
(define expr4 '(+* 1 2 3))
(eq? 1 (multiplier expr2))
(eq? 2 (multiplier (multiplicand expr4)))
(eq? 3 (multiplicand (multiplicand expr4)))



;; This works, but isn't simplified (grouping all similar powers of x together ...)
(deriv '(* x y) 'x)
(deriv '(* x y (+ x 3)) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)



