#lang planet neil/sicp

(define (reverse input)
  (define (reverse-helper input output)
    (if (null? (cdr input))
        (cons (car input) output)
        (reverse-helper (cdr input) (cons (car input) output))))
  (reverse-helper (cdr input) (cons (car input) nil)))

;; testing code
(define list1 (list 1 2 3 4 5))
list1
(reverse list1)