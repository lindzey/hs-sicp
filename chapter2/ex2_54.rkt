#lang racket

(define (atom? foo) (and (not (null? foo)) (not (pair? foo))))

(define (equal? list1 list2)
  (cond ((and (null? list1) (null? list2)) #t)
        ((null? list1) #f)
        ((null? list2) #f)
        ((and (atom? list1) (atom? list2)) (eq? list1 list2))
        ((atom? list1) #f)
        ((atom? list2) #f)
        (else (if (equal? (car list1) (car list2))
                  (equal? (cdr list1) (cdr list2))
                  #f))))

;; testing

(define list1 (list 1 2 3 4))
(define list2 (list 1 2 3 4))
(define list3 (list 1 2 3 5))
(define list4 (list 1 2 3 4 5))
(define list5 (list 1 2 (list 3 4) 5))
(define list6 (list (list 1 2) (list 3 4) 5))
(define list7 (list 1 2 (list 3 4) 5))

(eq? #t (equal? list1 list1))
(eq? #t (equal? list1 list2))
(eq? #f (equal? list1 list3))
(eq? #f (equal? list1 list4))
(eq? #f (equal? list1 list5))
(eq? #f (equal? list5 list6))
(eq? #t (equal? list5 list7))

(eq? #t (equal? '(this is a list) '(this is a list)))
(eq? #f (equal? '(this is a list) '(this (is a) list)))