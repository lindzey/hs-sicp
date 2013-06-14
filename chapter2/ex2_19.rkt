#lang planet neil/sicp

;; code from book's problem description


(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

;; code required for problem
(define (first-denomination coin-values)
  (car coin-values))

(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (no-more? coin-values)
  (null? coin-values))

;; The order of the input list should have no impact on the resulting output,
;; but will have an impace on the algorithm's performance

;; testing code
(define us-coins (list 50 25 10 5 1))
(define us-coins-unsorted (list 1 10 5 50 25))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(cc 100 us-coins)
(cc 100 us-coins-unsorted)
(define t0 (runtime))
(cc 500 us-coins)
(define t1 (runtime))
(cc 500 us-coins-unsorted)
(define t2 (runtime))
(- t1 t0)
(- t2 t1)