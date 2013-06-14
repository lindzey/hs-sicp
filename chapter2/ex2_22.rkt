#lang planet neil/sicp


;; code from book
(define (square x) (* x x))

(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items nil))

(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))


;; The first one will output the reversed list b/c it's nesting the square
;; of the first element inside a cons 
;; The second one will appear to be in order, but doesn't follow the list
;; convention where (car list) is a single element - instead, (cdr list)
;; will be a single element, and (car list) will be all the ones before
;; Checking my prediction ... yup.
(define input (list 1 2 3 4 5))
(square-list1 input)
(square-list2 input)