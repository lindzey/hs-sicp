#lang racket

;; for sets that allow duplication, element-of-set? and intersection-set are the same, just less
;; efficient b/c there's an infinite number of ways to represent the same set ...
;; (still O(n) in the number of elements in the set, but this is unbounded in terms of the
;; number of unique elements in the set)
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)        
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;; These are way cheaper - adjoin is constant time, and union-set is linear in the size of set1
;; (Assuming that append is linear in size of set1)
;; The only way that this representation is a good idea is if adjoin and union are way
;; more common operations than element and intersection. 
(define (adjoin-set x set)
  (cons x set)))

(define (union-set set1 set2)
  (append set1 set2))