#lang racket

(require "../utils.rkt")

(define (reverse1 sequence)
  (fold-right (lambda (x y)
                (flatten (list y x)))
              '()
              sequence))

(define (reverse2 sequence)
  (fold-left (lambda (x y) 
               (flatten (list y x)))
             '() 
             sequence))


(define list1 (list 1 2 3 4 5))
list1
(reverse1 list1)
(reverse2 list1)

;; Is it cheating to use flatten here to avoid having to properly 
;; keep track of the lists? Does this need to work on nested lists?