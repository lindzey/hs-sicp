#lang planet neil/sicp

;; part 1: define a procedure that takes a procedure of one argument and returns
;; a procedure that applies it twice
(define (double f)
  (lambda (x)
    (f (f x))))
          
;; testing code

(define (square x) (* x x))
(define doubled-square (double square))
(square 2)
(doubled-square 2)

(define (inc x) (+ x 1))
(define doubled-inc (double inc))
(inc 3)
(doubled-inc 3)
  

;; part2: what will (((double (double double)) inc) 5) return? should be 13
;; I totally guessed wrong ... tryign to figure it out
(((double (double double)) inc) 0)
((((double double) double) inc) 0)
;; these behave as I'd expect
(((double double) inc) 0)
((double (double inc)) 0)
;; clearly, it's 2^2^2, rather than 2^3. Oh, duh. since double calls the 
;; procedure on itself, it's effectively calling (four-times four-times)
