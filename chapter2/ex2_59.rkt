#lang racket

;; Code from book
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)        
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;; problem 2.59
;; I'm going to implement the union of sets by moving all elements from set1
;; that aren't in set2 into set2
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? (cdr set1)) (if (element-of-set? (car set1) set2)
                                set2
                                (cons (car set1) set2))) 
        ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
        (else (union-set (cdr set1) (cons (car set1) set2)))))

(define set1 (list 1 2 3 4 5))
(define set2 (list 2 4 6 8))
(union-set set1 set2)