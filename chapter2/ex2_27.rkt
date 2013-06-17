#lang racket

(require racket/trace)

;; code from 2.18
(define (reverse input)
  (define (reverse-helper input output)
    (if (null? (cdr input))
        (cons (car input) output)
        (reverse-helper (cdr input) (cons (car input) output))))
  (reverse-helper (cdr input) (cons (car input) '())))

;; This will be like reverse, but has to call reverse on both parts
;; Bah. I have the algorithm in my head, but am confused about list/cons, 
;; and thus can't get it to work. 
(define (deep-reverse input)
  (let ((pr1 (pair? (car input)))
        (pr2 (pair? (cdr input))))
        (cond ((null? input) '()) ; don't do anythign with null elements
          ;((null? (cdr input)) (car input)) ; atoms are returned
          ((and pr1 pr2) (list (deep-reverse (cdr input)) (deep-reverse (car input))))
          (pr1 (list (deep-reverse (cdr input)) (car input)))
          (pr2 (list (cdr input) (deep-reverse (car input))))
          (else (list (cdr input) (car input))))))
(trace deep-reverse)

;; testing code
(define x (list (list 1 2) (list 3 4)))
x
; => ((1 2) (3 4))
(reverse x)
; => ((3 4) (1 2))

(deep-reverse x)
; => ((4 3) (2 1))

