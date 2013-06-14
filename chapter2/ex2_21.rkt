#lang planet neil/sicp


;; code from the book
(define (map func items)
  (if (null? items)
      nil
      (cons (func (car items)) 
            (map func (cdr items)))))


;; functions to fill in
(define (square-list1 items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list1 (cdr items)))))

(define (square-list2 items)
  (map square items))

(define (square x) (* x x))

;; test code
(define input (list 1 2 3 4 5))
(square-list1 input)
(square-list2 input)

