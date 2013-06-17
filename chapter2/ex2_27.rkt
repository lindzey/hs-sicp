#lang racket

;; code from 2.18
(define (reverse input)
  (define (reverse-helper input output)
    (cond ((not (pair? input)) (cons input output))
          ((null? (cdr input)) (cons (car input) output))
          (else (reverse-helper (cdr input) (cons (car input) output)))))
  (reverse-helper (cdr input) (cons (car input) '())))

;; This will be like reverse, but has to call reverse on both parts
;; The key here is that we have two base cases: 
;; * For an atom, just return the atom
;; * For the last cons in a list (which will actually be a pair, cons'd
;;   with nil), don't do anything with the cdr (nil!)
;; * For a cons with 
(define (deep-reverse input)
  (cond ((not (pair? input)) input)
        ((null? (cdr input)) (deep-reverse (car input)))
        ((list? input) (list (deep-reverse (cdr input)) (deep-reverse (car input))))
        (else (cons (deep-reverse (cdr input)) (deep-reverse (car input))))))

;; testing code
(display "x: ")
(newline)
(define x (list (list 1 2) (list 3 4)))
x
; => ((1 2) (3 4))
(reverse x)
; => ((3 4) (1 2))
(deep-reverse x)
; => ((4 3) (2 1))

(display "y: ")
(newline)
(define y (list (list 1 2) (list 3 4) (list 5 6)))
y
(reverse y)
(deep-reverse y)

(display "z: ")
(newline)
(define z (list (cons 1 2) (cons 3 4) (cons 5 6)))
z
(reverse z)
(deep-reverse z)

(display "w: ")
(newline)
(define w (list (list (list 1 2) (list 3 4)) (list (list 5 6) (list 7 8))))
w
(reverse w)
(deep-reverse w)

(display "v: ")
(newline)
(define v (cons (list 1 2) (list 3 4)))
v
(reverse v)
(deep-reverse v)

(display "u: ")
(newline)
(define u (cons (cons 1 2) (cons 3 4)))
u
(reverse u)
(deep-reverse u)