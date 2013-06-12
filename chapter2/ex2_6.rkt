#lang racket


;; Church numerals are really really playing with my head
;; I haven't figured out how to explain them concisely

;; Zero is a procedure that operates on a procedure of a single 
;; variable and returns the result of applying that procedure 0x
(define zero (lambda (f) (lambda (x) x)))


;; (add-1 zero) will operate on a procedure and apply it once
;; ((add-1 (add-1 zero)) f) will return the procedure that applies
;; it twice
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; example usage of zero and add-1
(define (inc x) (+ x 1))
(define (square x) (* x x))

((zero inc) 5)
(((add-1 zero) inc) 5)
(((add-1 (add-1 zero)) inc) 5)
(((add-1 (add-1 (add-1 zero))) inc) 5)

((zero square) 2)
(((add-1 zero) square) 2)
(((add-1 (add-1 zero)) square) 2)
(((add-1 (add-1 (add-1 zero))) square) 2)


;; The problem wants:
;; a) Define one and two directly (not in terms of zero and add-1).
;; b) Give a direct definition of the addition procedure '+' 
;;       (not in terms of repeated application of add-1).

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
;; Testing - these should be the same as (add-1 zero) and (
;; add-1 (add-1 zero))
(display "testing direct implementation of 'one' and 'two'")
(newline)

((zero inc) 5)
((one inc) 5)
((two inc) 5)

((zero square) 2)
((one square) 2)
((two square) 2)

;; This works as desired, but was a lucky first guess ...
;; I'm no longer clear on what's happening here
(define (add-church g h) 
  (lambda (f) 
    (lambda (x) 
      ((h f) ((g f) x)))))

;; to test these ...
(display "testing add-church using f=inc)")
(newline)
(((add-church zero zero) inc) 5)
(((add-church zero one) inc) 5)
(((add-church one one) inc) 5)
(((add-church two one) inc) 5)
(((add-church two two) inc) 5)
(display "testing add-church using f=square)")
(newline)
(((add-church zero zero) square) 5)
(((add-church zero one) square) 5)
(((add-church one one) square) 5)
(((add-church two one) square) 5)
(((add-church two two) square) 5)