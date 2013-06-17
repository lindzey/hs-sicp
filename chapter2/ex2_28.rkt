#lang racket

;; this feels hacky, using list and append to get around thinking it through 
;; and using cons/list
(define (fringe x)
  (cond ((not (pair? x)) (list x))
        ((null? (cdr x)) (fringe (car x)))
        (else (append (fringe (car x)) (fringe (cdr x))))))

;; rather than splitting and then recombining, trying to just use cons
(define (fringe2 x)
  (cond ((not (pair? x)) x)
        ((null? (car x)) (fringe2 (cdr x)))
        ((not (pair? (car x))) (cons (car x) (fringe2 (cdr x))))
        (else (fringe2 (cons (car (car x)) (cons (cdr (car x)) (cdr x)))))))


;; testing code
(display "x: ")
(newline)
(define x (list (list 1 2) (list 3 4)))
x
; => ((1 2) (3 4))
(fringe x)
; => ((3 4) (1 2))
(fringe2 x)
; => ((4 3) (2 1))

(display "y: ")
(newline)
(define y (list (list 1 2) (list 3 4) (list 5 6)))
y
(fringe y)
(fringe2 y)

(display "z: ")
(newline)
(define z (list (cons 1 2) (cons 3 4) (cons 5 6)))
z
(fringe z)
(fringe2 z)

(display "w: ")
(newline)
(define w (list (list (list 1 2) (list 3 4)) (list (list 5 6) (list 7 8))))
w
(fringe w)
(fringe2 w)

(display "v: ")
(newline)
(define v (cons (list 1 2) (list 3 4)))
v
(fringe v)
(fringe2 v)

(display "u: ")
(newline)
(define u (cons (cons 1 2) (cons 3 4)))
u
(fringe u)
(fringe2 u)