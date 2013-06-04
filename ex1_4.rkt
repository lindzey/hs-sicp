#lang planet neil/sicp

;; this chooses whether to use + or - based on b's sign, 
;; rather than actually implementing absolute value

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 3 4)
(a-plus-abs-b 3 -4)