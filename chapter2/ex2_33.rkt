#lang racket

; code from the book
; NB - this only operates on sequences, not lists of lists
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; Part a
;(define (map p sequence)
;  (accumulate (lambda (x y) <??>) nil sequence))

(define (my-map func sequence)
  (accumulate (lambda (x y) (cons (func x) y)) '() sequence))

; testing code
(define (square x) (* x x))
(define mylist (list 1 2 3 4))
mylist
(my-map square mylist)


;; Part b 
;(define (append seq1 seq2)
;  (accumulate cons <??> <??>))
(define (my-append seq1 seq2)
  (accumulate cons seq2 seq1))

; testing code
(define list1 (list 1 2 3 4))
(define list2 (list 5 6 7 8 9 10))
(my-append list1 list2)



;; Part c
;(define (length sequence)
;  (accumulate <??> 0 sequence))
(define (my-length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
(my-length list1)
(my-length list2)
