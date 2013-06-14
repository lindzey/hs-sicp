#lang planet neil/sicp

(define (even? num)
  (= 0 (remainder num 2)))
(define (odd? num)
  (= 1 (remainder num 2)))

(define (same-parity . input)
  (let ((parity? (if (even? (car input)) even? odd?)))
    (define (parity-helper input)
      (if (null? input)
          nil
          (if (parity? (car input))
              (cons (car input) (parity-helper (cdr input)))
              (parity-helper (cdr input)))))
    (parity-helper input)))

;; testing code from the book
(same-parity 1 2 3 4 5 6 7)
; => (1 3 5 7)
(same-parity 2 3 4 5 6 7)
; => (2 4 6)