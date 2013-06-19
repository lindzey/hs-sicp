#lang racket

(provide square)
(define (square x) (* x x))

(provide cube)
(define (cube x) (* x x x))

;; from the book, section 2.2.3
(provide accumulate)
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; from prob 2.28
(provide fringe)
(define (fringe x)
  (cond ((not (pair? x)) x)
        ((null? (car x)) (fringe (cdr x)))
        ((not (pair? (car x))) (cons (car x) (fringe (cdr x))))
        (else (fringe (cons (car (car x)) (cons (cdr (car x)) (cdr x)))))))

;; from prob 2.36
(provide accumulate-n)
(define (accumulate-n op init seq)
  (if (null? (car seq))
      '()
      (cons (accumulate op init (map car seq))
            (accumulate-n op init (map cdr seq)))))