#lang planet neil/sicp

;; For log(n) growth, I'd expect numbers near 1,000,000 to take 2x as long as those
;; near 1000. This log(n) growth comes  mnfrom the time required by expmod, which 
;; fast-prime calls a fixed number of times (so its really c*log(n)). For primes,
;; it will be called all c times, while for non-primes, it'll probably 
;; terminate sooner. If we're just running on primes, this shouldn't matter.

; code from ex 1.22
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 20)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
; code from book
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a ))
  (try-it (+ 1 (random (- n 1)))))
; uses property that a*b mod m = ((a mod b)*(b mod m) mod m)
; in order to efficiently calculate base^exp mod m
(define (expmod base exp m) 
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))
(define (square n)
  (* n n))

(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)

(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)


(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)

(timed-prime-test 100000007)
(timed-prime-test 100000037)
(timed-prime-test 100000039)

; there's a lot of variance in how long this takes ... probably due to which 
; numbers are chosen in the fermat. However, it is consistently just shy of 2x
; the time for primes that are ^2 bigger, which I would NOT have expected. 
; The only function that scales w/ input value's size is expmod, so the answer 
; has to be there ...

(define (time-expmod a n)
  (start-time-expmod a n (runtime)))
(define (start-time-expmod a n start-time)
  (expmod a n n)
  (define time-elapsed (- (runtime) start-time))
  (newline)
  (display time-elapsed))

(newline)
(display " time expmod for: ")
(display 1009)
(time-expmod 2 1009)
(time-expmod 4 1009)
(time-expmod 8 1009)
(time-expmod 16 1009)
(time-expmod 32 1009)
(time-expmod 64 1009)
(time-expmod 128 1009)
(time-expmod 256 1009)

(newline)
(display " time expmod for: ")
(display 1000003)
(time-expmod 2 1000003)
(time-expmod 4 1000003)
(time-expmod 8 1000003)
(time-expmod 16 1000003)
(time-expmod 32 1000003)
(time-expmod 64 1000003)
(time-expmod 128 1000003)
(time-expmod 256 1000003)
