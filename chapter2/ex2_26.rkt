#lang racket

(define x (list 1 2 3))
(define y (list 4 5 6))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

;; Question: What result is printed by the interpreter in response to 
;; evaluating each of the following expressions:

(append x y)
; append takes the elements from both lists and returns 
; a new list of the combined elements
; => '(1 2 3 4 5 6)



(cons x y)
; Cons will effectively have the list x as the first elemetn in the new list
; => '((1 2 3) 4 5 6)


(list x y)
; List will creat a new null-terminated list with x and y as the first 2 
; elements of it
; => '((1 2 3) (4 5 6)
