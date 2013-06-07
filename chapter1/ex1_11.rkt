#lang planet neil/sicp

;; f(n) =  n                           for n  < 3
;;         f(n-1) + 2f(n-2) + 3f(n-3)  otherwise


;; Recursive function

(define (f_rec n)
  (cond ((= 0 n) 0)
        ((= 1 n) 1)
        ((= 2 n) n)
        (else (+ (f_rec (- n 1))
                 (* 2 (f_rec (- n 2)))
                 (* 3 (f_rec (- n 3)))))))

;; test cases ... should all be true
(= 0 (f_rec 0))
(= 1 (f_rec 1))
(= 2 (f_rec 2))
(= 4 (f_rec 3))
(= 11 (f_rec 4))
(= 25 (f_rec 5))
(= 59 (f_rec 6))
(= 142 (f_rec 7))

;; Iterative function

(define (f_iter n)
  (cond ((= 0 n) 0)
        ((= 1 n) 1)
        ((= 2 n) 2)
        (else (f_helper 0 1 2 (- n 2)))))
(define (f_helper a b c count)
  (cond ((= count 0) c)
        (else (f_helper b c (+ (* 3 a) (* 2 b) c) (- count 1)))))

;; test cases ... should all be true
(= 0 (f_iter 0))
(= 1 (f_iter 1))
(= 2 (f_iter 2))
(= 4 (f_iter 3))
(= 11 (f_iter 4))
(= 25 (f_iter 5))
(= 59 (f_iter 6))
(= 142 (f_iter 7))
