#lang racket

(define (square x) (* x x))
(define (atom? x) (and (not (null? x)) (not (pair? x))))

;; NB - use 'cons' to reconstruct tree that's been disassembled using
; car and cdr, b/c using 'list' would add additional '() 
(define (square-tree tree)
  (cond ((atom? tree) (square tree))
        ((null? tree) '())
        (else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

;; test provided by the book
(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
; -> (1 (4 (9 16) 25) (36 49))

