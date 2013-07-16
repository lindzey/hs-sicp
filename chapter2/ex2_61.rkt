#lang racket

(require (except-in "ordered_sets.rkt" adjoin-set))

;; implementing adjoin to take half as long as the original one 
(define (adjoin-set x set)
  (cond ((null? set) x) ;; x bigger than any element in the set; add to end
        ((= x (car set)) set) ;; x already in the set, can roll back up and return original set
        ((< x (car set)) (cons x set)) ;; x needs to be inserted just before current element
        (else (cons (car set) (adjoin-set x (cdr set)))))) ;; x would belong after current element, so keep going
  
(define list1 (list 1 2 4 5 6 7))
(adjoin-set 3 list1)
(adjoin-set 2 list1)


