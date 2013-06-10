#lang racket

;(require (only-in "../utils.rkt" cube))
;(require (except-in "../utils.rkt" square))
(require (prefix-in utils. "../utils.rkt"))

(define (square x) (* x x x))

(square 2)