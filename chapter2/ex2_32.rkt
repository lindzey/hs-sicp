#lang racket

;; This works, b/c the subsets of a list of n+1 elements will be all subsets 
;; of the list of n elements, along with the list of subsets with the n+1-th 
;; element appended.
;; Our lambda function simply cons-es the first element in the list with the
;; subsets of the rest of the list. 
(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(define ll (list 1 2 3))
ll
(subsets ll)