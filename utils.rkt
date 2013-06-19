#lang racket

(provide square)
(define (square x) (* x x))

(provide cube)
(define (cube x) (* x x x))

(provide accumulate)
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(provide fringe)
(define (fringe x)
  (cond ((not (pair? x)) x)
        ((null? (car x)) (fringe (cdr x)))
        ((not (pair? (car x))) (cons (car x) (fringe (cdr x))))
        (else (fringe (cons (car (car x)) (cons (cdr (car x)) (cdr x)))))))