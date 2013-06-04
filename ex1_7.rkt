#lang planet neil/sicp

;; the current good-enough requires that the estimate and the actual are within 
;; a constant distance from each other, when it would make more sense to require
;; them to be w/in some % 
;; for small numbers, this means that it will terminate way too soon, 
;; and for large numbers, it will take way too long 
;; Q - for large numbers, will it die w/ out-of-memory? Not unless we acatually
;;    can't represent the number itself (or a single operation on it) in memory.
;     according to sec 1.2.1 of SICP, Scheme is tail recursive and can evaluate
;;    an iterative process (but recursive *procedure*) like this in constant
;;    memory.
;; Q - what about going into an infinite loop where it can never get small enough 
;;    due to representation? I think this is what actually happens ... 

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (sqrt x) (sqrt-iter 1.0 x))


;; showing limitations of current approach:
(square (sqrt 0.00005))
;; takes forever! (I killed it)
(square (sqrt 5000000000000000000000000000000000000))


(define (new-good-enough? guess old-guess x)
  (< (abs (- 1.0 (/ old-guess guess))) 0.0001))
  
(define (new-sqrt-iter guess old-guess x)
  (if (new-good-enough? guess old-guess x)
      guess
      (new-sqrt-iter (improve guess x)
                     guess
                     x)))

;; want to start it out w/ the correct jump....
(define (new-sqrt x) (new-sqrt-iter (improve 1.0 x) 1.0 x))

;; showing improvement; both of these return quickly, 
;; with values of appropriate precision
(square (new-sqrt 0.00005))
; never terminates! (well, I lost patience). I need to learn more about 
; exactly what happens in scheme wrt fp representations. I'm assuming that
; we wind up with a number large enough that the rounding errors are guaranteed
; to be larger than 0.001
;(square (new-sqrt 5000000000000000000000000000000000000))