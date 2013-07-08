#lang racket

;; untested, b/c we don't yet have the picture language
;; framework built up

;; generalizing the splitting operation
;; TODO: I'm not at all sure that this is the right way to do things ...
(define (split dir1 dir2)
  (lambda (painter n) 
    (if (= n 0)
        painter
        (let ((smaller ((split dir1 dir2) painter (- n 1))))
          (dir1 painter (dir2 smaller smaller))))))
                

(define right-split2 (split beside below))
(define up-split2 (split below beside))