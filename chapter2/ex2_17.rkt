#lang planet neil/sicp

(define (last-pair input)
  (if (null? (cdr input))
      (car input)
      (last-pair (cdr input))))


;; testing code
(define list1 (list 1 2 3 4 5))
(= 5 (last-pair list1))
