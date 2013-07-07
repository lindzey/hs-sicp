#lang racket

(require "../utils.rkt")

;; Write a procedure to find all ordered triples of distinct 
;; positive integers i, j, and k less than or equal to a given 
;; integer n that sum to a given integer s.

;; Could probably reuse unique pairs rather than writing from scratch?
(define (unique-triplets n)
  (accumulate append
              '()
              (flatmap (lambda (i) 
                     (map (lambda (j)
                            (map (lambda (k)
                                 (list i j k))
                                 (enumerate-interval 1 (- j 1))))
                          (enumerate-interval 2 (- i 1))))
                   (enumerate-interval 3 n))))

(unique-triplets 6)

;; checks whether the input list sums to s
(define (triplet-sum? ll ss)
  (eq? ss (+ (car ll) (cadr ll) (cadr (cdr ll)))))
(triplet-sum? (list 1 2 3) 6)
(triplet-sum? (list 1 2 3) 7)

(define (unique-triplet-sum n s)
  (define (my-filter ll) (triplet-sum? ll s))
  (filter my-filter (unique-triplets n)))
(unique-triplet-sum 6 10)