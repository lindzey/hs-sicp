#lang racket

(require "../utils.rkt")

(define (accumulate-n op init seq)
  (if (null? (car seq))
      '()
      (cons (accumulate op init (map car seq))
            (accumulate-n op init (map cdr seq)))))

 (define seq (list (list 1 2 3) 
                   (list 4 5 6) 
                   (list 7 8 9) 
                   (list 10 11 12)))
 (accumulate-n + 0 seq)
 ; => (22 26 30)