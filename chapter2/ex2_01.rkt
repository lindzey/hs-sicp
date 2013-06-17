#lang planet neil/sicp

;; code given in book / ex 1.20
(define (gcd a b)
  (if (= b 0) 
      a
      (gcd b (remainder a b))))

;; need a make-rat that handles negative integers
;; to do this, we check whether the sign should be 
(define (make-rat n d) 
  (let ((sign (if (< (* n d) 0) -1 1))
        (g (gcd (abs n) (abs d))))
    (cons (* sign 
             (/ (abs n) g)) 
          (/ (abs d) g))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display " / ")
  (display (denom x)))

;; testing ...
(define ww (make-rat -3 6))
(print-rat ww)
(define xx (make-rat 3 6))
(print-rat xx)
(define yy (make-rat -3 -6))
(print-rat yy)
(define zz (make-rat 3 -6))
(print-rat zz)


  
    
    
    
    