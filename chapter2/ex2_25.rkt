#lang planet neil/sicp

;; trying to pick 7 from these lists
; (1 3 (5 7) 9)
(define list1 (cons 1 (cons 3 (cons (cons 5 7) 9))))
list1
(define list1b (list 1 3 (cons 5 7) 9))
list1b

(cdr (car (cdr (cdr list1))))
(cdr (car (cdr (cdr list1b))))

;((7))
(define list2 (list (list 7)))
list2
(car (car list2))

;(1 (2 (3 (4 (5 (6 7))))))
(define list3 (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 7)))))))
list3
(cdr (cdr (cdr (cdr (cdr (cdr list3))))))
