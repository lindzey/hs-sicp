#lang planet neil/sicp

;; fucntions required for newton's method, copied from the book

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define dx 0.00001)
(define (deriv f)
  (lambda (x)
    (/ (- (f (+ x dx)) (f x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

;; now my cubic function
(define (square x) (* x x))
(define (cube x) (* x (square x)))
(define (cubic a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))

;; and, the testing code

((cubic 1 2 3) 1)
((deriv (cubic 1 2 3)) 1)

(define (test-coeffs a b c)
  (define x0 (newtons-method (cubic a b c) 1.0))
  (display "testing newton's method!")
  (newline)
  (display "x0 = ");
  (display x0)
  (newline)
  (display "y0 = ");
  (define y0 ((cubic a b c) x0))
  (display y0)
  (newline))
; should have solution at x=0
(test-coeffs 1 2 0)
(test-coeffs 1 2 3)
(test-coeffs 4 2 3)
(test-coeffs 1.2 0 1)
