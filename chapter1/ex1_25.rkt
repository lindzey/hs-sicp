#lang planet neil/sicp

;; No, I don't think she's correct. I expect her expmod to be much slower for
;; large numbers as large-enough numbers require longer to perform operations on.
;; It might even lead to out-of-memory errors ...


(define (test-expmod base exp m)
  (define t1 (time-op expmod base exp m))
  (newline)
  (display "time elapsed for ")
  (display base)
  (display " ")
  (display exp)
  (display " ")
  (display m)
  (display " ** ")
  (display t1)
  (display " ")
  (define t2 (time-op expmod2 base exp m))
  (display t2))

(define (time-op op base exp m)
  (define t0 (runtime))
  (op base exp m)
  (define t1 (runtime))
  (- t1 t0))
    

(define (expmod2 base exp m)
  (remainder (fast-expt base exp) m))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(define (expmod base exp m) 
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))
(define (square n)
  (* n n))
(define (even? n)
  (= 2 (remainder n 2)))

;; showing the time differences for smaller numbers
; and then running out of memory for larger ones!
(test-expmod 5 1009 1009)
(test-expmod 9 10007 10007)
(test-expmod 9 100003 100003)
(newline); to show that only the expmod2 runs out of memory...
(time-op expmod 21 1000003 1000003)
(test-expmod 21 1000003 1000003)
