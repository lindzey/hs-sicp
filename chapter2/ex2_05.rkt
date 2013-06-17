#lang planet neil/sicp

;; representing a (nonnegative!) pair (a, b) = (2^a)(3^b) = p
;; In this case, a = log_2 (the result of dividing p by 3 until it no longer divides evenly)

;; easy inefficient implementation
(define (exp base expt)
  (if (= 0 expt)
      1
      (* base (exp base (- expt 1)))))

(define (cons a b)
  (* (exp 2 a)
     (exp 3 b)))

(define (remove num factor)
  (if (= 0(remainder num factor))
      (remove (/ num factor) factor)
      num))

;; *only* works if base evenly divides num
(define (log num base)
  (if (= num 1)
      0
      (+ 1 (log (/ num base) base))))

(define (car pair)
  (log (remove pair 3) 2))
(define (cdr pair)
  (log (remove pair 2) 3))


;; testing that it works
(define foo (cons 3 5))
(car foo)
(cdr foo)