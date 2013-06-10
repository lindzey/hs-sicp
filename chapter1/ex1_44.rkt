#lang planet neil/sicp


;; smoothing a function ... 
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))


;; testing this requires a function that's not smooth on the scale of dx
;; this should return (2.5/3)
(define dx 1.0)
((smooth abs) 0.5)

;; n-fold smoothing can be 
(define (compose f g)
  (lambda (x)
    (f (g x))))
(define (repeated f n)
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))))
(define (smooth-n-fold f n)
  (repeated (smooth f) n))

((smooth-n-fold abs 3) 0.5)
((smooth-n-fold abs 3) 1.0)
((smooth-n-fold abs 3) 0)