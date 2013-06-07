#lang planet neil/sicp

;; Implement newton's cube root approximation
(define (cube x) (* x x x))

(define (good-enough? guess old-guess x)
  (< (abs (- 1.0 (/ guess old-guess))) 0.001))

(define (improve guess x)
  (/ (+ 
      (/ x (* guess guess)) 
      (* 2 guess)) 
     3))

(define (cube-root-iter guess old-guess x)
  (if (good-enough? guess old-guess x)
      guess
      (cube-root-iter (improve guess x) guess x)))

(define (cube-root x) (cube-root-iter (improve 1.0 x) 1.0 x))


;; testing code
(cube 3)
(cube 4)
(cube 0.1)

(cube (cube-root 27))
(cube (cube-root 64))
(cube (cube-root 0.001))