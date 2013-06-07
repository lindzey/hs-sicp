#lang racket

;; recursive implementation of pascal's triangle
(define (pascal row col)
  (cond ((= col 1) 1)
        ((= row col) 1)
        (else (+ (pascal (- row 1) col) 
                 (pascal (- row 1) (- col 1))))))

;; test functions
(= 1 (pascal 1 1))
(= 1 (pascal 2 1))
(= 1 (pascal 2 2))
(= 1 (pascal 3 1))
(= 2 (pascal 3 2))
(= 1 (pascal 3 3))
(= 1 (pascal 4 1))
(= 3 (pascal 4 2))
(= 3 (pascal 4 3))
(= 1 (pascal 4 4))
(= 1 (pascal 5 1))
(= 4 (pascal 5 2))
(= 6 (pascal 5 3))
(= 4 (pascal 5 4))
(= 1 (pascal 5 5))