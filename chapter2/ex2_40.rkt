#lang racket

(require "../utils.rkt")

;; function that outputs the list of all numbers x=i:1:j
(define (enumerate-interval i j)
  (if (< j i)
      '()      
      (cons i (enumerate-interval (+ i 1) j))))

(enumerate-interval 2 4)
(enumerate-interval 1 10)

;generates the sequence of pairs (i,j) with 1 <= j < i <= n. 
(define (unique-pairs n)
  (accumulate append 
              '()
              (map (lambda (i) 
                     (map (lambda (j) (list i j))
                          (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 2 n))))
(unique-pairs 5)

;; Use unique-pairs to simplify the definition of prime-sum-pairs given above.
; definition from book

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
(define (old-prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))

(old-prime-sum-pairs 10)

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))
(old-prime-sum-pairs 10)