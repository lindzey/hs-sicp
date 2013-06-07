#lang planet neil/sicp

(gcd 206 40)
;; for applicative order, evaluate, then apply:
(gcd 206 40)
;; using the substitution step:
;; special case for if - only evaluate 2nd operand
(if (= 40 0) 206 (gcd 40 (remainder 206 40)))  
(gcd 40 (remainder 206 40))
(gcd 40 6)
(if (= 6 0) 40 (gcd 6 (remainder 40 6)))
(gcd 6 (remainder 40 6))
(gcd 6 4)
(if (= 4 0) 6 (gcd 4 (remainder 6 4)))
(gcd 4 (remainder 6 4))
(gcd 4 2)
(if (= 2 0) 4 (gcd 2 (remainder 4 2)))
(gcd 2 (remainder 4 2))
(gcd 2 0)
(if (= 0 0) 2 (gcd (remainder 2 0)))
2 ;; This required 5 remainder operations

;; code given in book
(define (gcd a b)
  (if (= b 0) 
      a
      (gcd b (remainder a b))))


;; for normal order, expand fully
(gcd 206 40)
;; using the substitution step:
(if (= 40 0) 206 (gcd 40 (remainder 206 40)))
;; NB - the if statment is always evaluated in the same way for normal and 
;; applicative order ...
; level 1
(gcd 40 (remainder 206 40)))
(if (= 0 (remainder 206 40)) 
    40 
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
(if (= 0 6) 
    40 
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
; level 2
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

(if (= 0 (remainder 40 (remainder 206 40)))
    (remainder 206 40)
    (gcd 
     (remainder 40 (remainder 206 40)) 
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(if (= 0 (remainder 40 6))
    (remainder 206 40)
    (gcd 
     (remainder 40 (remainder 206 40)) 
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(if (= 0 4)
    (remainder 206 40)
    (gcd 
     (remainder 40 (remainder 206 40)) 
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; level 3
(gcd 
 (remainder 40 (remainder 206 40)) 
 (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;; .... OK, I'm sick of this already. point taken. 
;; for each if statement, we evaluate ??? remainder operations
;; TODO - NOT FINISHED!
