#lang planet neil/sicp
;; worked on in collaboration w/ Rob B.


(define (p) 
  (p))
(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;; note that all are invalid, but the behavior is different for:
;; 1 - (define (p) (p))
;; 2 - (define (p) p)
;; 3 - (define p (p))
;; 4 - (define p p)
;; For normal-order evaluation (fully expand and reduce) 
;; vs applicative-order (evaluate then apply) 
;; 1 - applicative order enters an infinite loop as it 
;;     attempts to substitute (p) in for (p) in the 
;;     call to test. Normal order would expand a finite number
;;     of times until it gets (if #t 0 (p))
;; 2 - both (p) and p evaluate to <procedure:p>, so both eval models
;;     would return 0
;; 3 & 4 - here, the define statement tries to evaluate (p) or p to 
;;     to assign it to p, at which point it fails
