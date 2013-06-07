#lang planet neil/sicp

;; code from book
(define(timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (define is-prime (prime? n))
  (if is-prime
      (report-prime n (- (runtime) start-time)))
  is-prime)

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
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? test-divisor n)
  (= 0 (remainder n test-divisor)))
(define (square n) (* n n))


;; "check primality of odd integers in specified range"
;; assumes that min will be an odd integer
(define (search-for-primes start num-found)
  (if (< num-found 3)
      (if (timed-prime-test start)
          (search-for-primes (+ start 2) (+ 1 num-found))
          (search-for-primes (+ start 2) num-found))
      (and (newline) (display "done") (newline))))

;; now, use search-for-primes to find 3 smalles primes greater than 
;; 1000, 10000, 100000, 1000000
;; I couldn't figure out how to use the provided start-prime-test and automatically
;; stop after finding three, since it prints out the prime, but doesn't pass anything
;; back to the calling function. Thus, I've modified it
(search-for-primes 1001 0)
(search-for-primes 10001 0)
(search-for-primes 100001 0)
(search-for-primes 1000001 0)
(search-for-primes 10000001 0)
(search-for-primes 100000001 0)
;; At each multiplication by 10, the time required went up by ~3, 
;; as expected for an algorithm that's Theta(sqrt(n))
;; This also suggests that my computer runs programs in a time proportional to 
;; the steps required. 

