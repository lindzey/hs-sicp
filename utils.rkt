#lang racket

(provide square)
(define (square x) (* x x))

(provide cube)
(define (cube x) (* x x x))

;; From Ch1
(provide prime?)
(define (prime? n)
  (= n (smallest-divisor n)))
   
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? test-divisor n)
  (= 0 (remainder n test-divisor)))


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

;; from prob 2.38
(provide fold-right)
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(provide fold-left)
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))