#lang planet neil/sicp

;; modifying timed-prime-test to only test divisors 2,3,5,7,9... rather than
;; 2,3,4,5,6,7,8,9...

(define(timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (define is-prime (prime? n))
  (if is-prime
      (report-prime n (- (runtime) start-time))))

(define (report-prime num elapsed-time)
  (newline)
  (display num)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))
   
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? test-divisor n)
  (= 0 (remainder n test-divisor)))
(define (square n) (* n n))

;; new code
(define (next n)
  (if (= n 2)
      3
      (+ n 2)))


;; I'm betting that this does NOT give as great a payoff as you'd expect, b/c
;; testing if a number is divisible by 2 is really fast, and I expect that 
;; Scheme's implementation of remainder uses this. Does it optimize the 
;; (= 0 (remainder...)) test??

;; In practice, it was only about a 30% improvement, not 50%

;; test code
(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)

(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)

(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)

(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)