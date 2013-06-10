#lang planet neil/sicp

;; approximating tan(x) w/ k iterations, using a modified version of cont-frac
(define (tan-cf x k)
  (define (cont-frac n d)
    (define (rec-helper n d i)
      (if (> i k)
          0
          (/ (n x i) (+ (d i) (rec-helper n d (+ i 1))))))
    (rec-helper n d 1.0))
  (cont-frac (lambda (x i) (if (= 1 i)
                               x
                               (- (* x x))))
             (lambda (i) (- (* 2 i) 1))))

;; testing ... 
; tan(0) = 0
(display "testing tan(0) = 0")
(newline)
(tan-cf 0 1)
(tan-cf 0 2)
(tan-cf 0 5)
(tan-cf 0 10)

; tan(0.7854) = 1  (pi/4)
(display "testing tan(pi/4) = 1")
(newline)
(tan-cf 0.7854 1)
(tan-cf 0.7854 2)
(tan-cf 0.7854 5)
(tan-cf 0.7854 10)

