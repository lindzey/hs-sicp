#lang planet neil/sicp

(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner 
       (if (filter a) (term a) null-value)
       (filtered-accumulate filter combiner null-value term (next a) next b))))

;; sum-of-squares of primes
(define (ssp a b)
  (filtered-accumulate prime? + 0 square a inc b))


(define (square n) (* n n))
(define (inc n) (+ n 1))
; from problem 1.22 - erroneously reports that 1 is prime
(define (prime? n)
  (= n (smallest-divisor n)))
   
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? test-divisor n)
  (= 0 (remainder n test-divisor)))

;; testing sum of squares of all primes in interval
;; primes are:  2 3 5  7  11  13  17  19  23  29
;; squares are: 4 9 25 49 121 169 289 361 529 841
(= 13 (ssp 2 4))
(= 34 (ssp 3 6))
(= 364 (ssp 4 14))

;; product of all positive integers less than n that are relatively prime to n
(define (prp n)
  (define (rp? x) (relatively-prime? x n))
  (filtered-accumulate rp? * 1 iden 1 inc n))

(define (iden n) n)
(define (relatively-prime? x n) 
  (= 1 (gcd x n)))
(define (gcd a b)
  (if (= b 0) 
      a
      (gcd b (remainder a b))))
          
;; for n = 10, factors are 1 2 5, so we want 3*7*9 = 189
(= 189 (prp 10))
;; for n = 11, all integers are relatively prime, so prp = 10! = 3628800
(= 3628800 (prp 11))