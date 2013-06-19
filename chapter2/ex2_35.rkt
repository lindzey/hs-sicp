#lang racket

(require "../utils.rkt")

;; What I really want to do here is just apply (fringe t), but the 'map'
;; in the template makes me think something else is wanted by the problem

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (fringe t))))


(define mytree (list 1 2 (list 3 4) 5))
(count-leaves mytree)

