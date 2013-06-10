#lang planet neil/sicp

;; recursive definition of continued fraction, from problem 1.37
(define (cont-frac n d k)
  (define (rec-helper n d i k)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (rec-helper n d (+ i 1) k)))))
  (rec-helper n d 1 k))

;; approximation to e based on continued-fraction
(define (euler k)
  (+ 2
     (cont-frac
      (lambda (i) 1.0)
      (lambda (i) (if (= 2 (remainder i 3))
                      (* 2 (/ (+ i 1) 3))
                      1))
      k)))

;; 
(define e 2.71828)
e
(euler 1)
(euler 2)
(euler 4)
(euler 10)
(euler 100)
