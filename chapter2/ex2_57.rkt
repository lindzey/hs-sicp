#lang racket

;(require (except-in "symbolic_math.rkt" make-sum addend augend 
;                    make-product multiplier multiplicand deriv))


(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (addend s) 
  (cadr s))
(define (augend s) 
  (if (null? (cdddr s))
         (caddr s)
         (cons '+ (cddr s))))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) 
  (if (null? (cdddr p))
      (caddr p)
      (cons '* (cddr p))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))


(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

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



