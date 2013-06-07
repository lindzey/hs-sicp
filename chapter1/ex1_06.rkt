#lang planet neil/sicp

;; I expect the new-sqrt-iter program to drop down into an infinite loop
;; evaluating new-sqrt-iter, as BOTH args of new-if are evaluated every time,
;; causing infinite recursion
;; (and, when tested, we ran out of memory!)

(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x)
                         x)))

(define (sqrt x) (sqrt-iter 1.0 x))
(define (new-sqrt x) (new-sqrt-iter 1.0 x))

(new-sqrt 2.0)
(sqrt 4.0)