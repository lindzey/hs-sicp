#lang planet neil/sicp

;; fixed-point procedure from the book
(define (fixed-point f x)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
          next
          (and 
           (display next)
           (newline)
           (try next)))))
  (try x))

(display "w/o damping:")
(newline)
(fixed-point (lambda (x) (/ (log 100) (log x))) 2.0)

(display "w/ damping:")
(newline)
(define (average x y) (/ (+ x y) 2))
(fixed-point (lambda (x) (average x (/ (log 100) (log x)))) 2.0)

;; Holy cow, that's a big improvement! 54 vs 8! w/o damping it overshoots a lot, 
;; causing oscillations and a long settling time. 