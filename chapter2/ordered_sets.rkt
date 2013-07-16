#lang racket

(provide element-of-set?)
(provide intersection-set)
(provide adjoin-set)




;; code from book
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()    
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x1)
               (intersection-set set1 (cdr set2)))))))

;; code from 2.61
(define (adjoin-set x set)
  (cond ((null? set) x) ;; x bigger than any element in the set; add to end
        ((= x (car set)) set) ;; x already in the set, can roll back up and return original set
        ((< x (car set)) (cons x set)) ;; x needs to be inserted just before current element
        (else (cons (car set) (adjoin-set x (cdr set)))))) ;; x would belong after current element, so keep going
 

