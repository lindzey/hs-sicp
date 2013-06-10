#lang planet neil/sicp

;; recursive implementation, working outside-in by keepign track of current
;; k and stopping when it hits input k
(define (cont-frac-rec n d k)
  (define (rec-helper n d i k)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (rec-helper n d (+ i 1) k)))))
  (rec-helper n d 1 k))

;; iterative, working inside-out, starting with input k and building out until we
;; get to (n 1)
(define (cont-frac-iter n d k)
  (define (iter-helper n d i k current)
    (if (= 0 i)
        current
        (iter-helper n d (- i 1) k (/ (n i) (+ (d i) current)))))
  (iter-helper n d k k 0))

;; actual value of gr
(define gr (/ (+ 1 (sqrt 5)) 2))
(define (close-enough? val) 
  (< (abs (- val (/ 1 gr))) 0.00001))

;; testing recursive version
(define (psi-rec n) (cont-frac-rec (lambda (i) 1.0) (lambda (i) 1.0) n))
(define (test-frac-rec n)
  (if (close-enough? (psi-rec n))
      (display n)
      (test-frac-rec (+ n 1))))
(display "testing recursive: ")
(test-frac-rec 0)
(newline)


;; testing iterative version
(define (psi-iter n) (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) n))
(define (test-frac-iter n)
  (if (close-enough? (psi-iter n))
      (display n)
      (test-frac-iter (+ n 1))))
(display "testing iterative: ")
(test-frac-iter 0)
(newline)
