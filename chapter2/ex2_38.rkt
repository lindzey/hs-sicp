#lang racket


(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))


(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;; a -> 1/(2/3) => 1.5
(fold-right / 1 (list 1 2 3))
;; b -> (1/2)/3 => 1/6
(fold-left / 1 (list 1 2 3))

;; c -> (1 (2 (3)))
;; not quite -> the notation that racket uses is (3 ())
;; c -> (1 (2 (3)))
(fold-right list '() (list 1 2 3))

;; d -> (((() 1) 2) 3)
(fold-left list '() (list 1 2 3))

;; e
; for fold-left and fold-right to be the same, op needs to
; satisfy:
; (op (op a b) c) == (op a (op b c))
