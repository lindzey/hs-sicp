#lang planet neil/sicp

;; 
(define (f g) (g 2))
;; I'm predicting that (f f) evaluates to (2 2), which will get an error b/c 2 is not
;; a valid procedure.
(f f)
(2 2)
;; yup - both gave the same error