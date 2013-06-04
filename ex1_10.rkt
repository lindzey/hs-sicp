#lang planet neil/sicp

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)

(A 1 10)
(A 0 (A 1 9))
(* 2 (A 1 9))
(* 2 (A 0 (A 1 8)))
(* 2 2 (A 1 8))
(* 2 2 (A 0 (A 1 7)))
(* 2 2 2 (A 1 7))
(* 2 2 2 (A 0 (A 1 6)))
(* 2 2 2 2 (A 1 6))
(* 2 2 2 2 (A 0 (A 1 5)))
(* 2 2 2 2 2 (A 1 5))
(* 2 2 2 2 2 (A 0 (A 1 4)))
(* 2 2 2 2 2 2 (A 1 4))
(* 2 2 2 2 2 2 (A 0 (A 1 3)))
(* 2 2 2 2 2 2 2 (A 1 3))
(* 2 2 2 2 2 2 2 (A 0 (A 1 2)))
(* 2 2 2 2 2 2 2 2 (A 1 2))
(* 2 2 2 2 2 2 2 2 (A 0 (A 1 1)))
(* 2 2 2 2 2 2 2 2 2 (A 1 1))
(* 2 2 2 2 2 2 2 2 2 2)
; = 2^10
; so, if x = 1 & y > 0, A(x, y) = 2 ^ y

(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2)))
;; at this point, we know this is 2^(2^(2^2)) = 65536

(A 3 3)
(A 2 (A 3 2))
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2))
(A 2 (A 1 (A 2 1)))
(A 2 (A 1 2))
(A 2 4)
;; Q: can you always shift like this? - NO
(A 4 2)

;; To actually answer the question:
;; (A 0 n) := 2*n
;; (A 1 n) := 2 ^ n
;; (A 2 n) := 2 ^ 2 ... ^ 2 (w/ n 2's ... I don't know what this fxn is)