#lang racket

(require "../utils.rkt")

;; from problem statement

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;; Fill in the missing expressions in the following procedures for computing 
;; the other matrix operations. 
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product v x)) m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))


;; testing code
(define mat1 (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
; [1 2 3 4;
;  4 5 6 6;
;  6 7 8 9]
(define mat2 (list (list 1 2) (list 3 4) (list 5 6) (list 7 8)))
(define vec1 (list 1 2 3 4))
; 1 2 3 4
(matrix-*-vector mat1 vec1)
(transpose mat1)
(matrix-*-matrix mat1 mat2)
