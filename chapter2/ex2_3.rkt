#lang racket

(require (prefix-in utils. "../utils.rkt"))

(module rect-impl1 racket
  (provide rect)
  (provide length)
  (provide width)
  ;; define the constructor, and 
  ;(define (rect pt1 pt2 pt3 pt4)
  (define (rect)
    (newline))
  (define (length r)
    (newline))
  (define (width r)
    '())
  )

(module rect-impl2 racket
  (provide rect)
  (provide length)
  (provide width)
  ;; define the constructor, and 
  ;(define (rect pt1 pt2 pt3 pt4)
  (define (rect)
    (display "created rectangle!"))
  (define (length r)
    (display "called length"))
  (define (width r)
    (display "called width"))
  )

;; Testing code - want to have a rect module passed in,
;; then test the perimeter and area procedures on it

;(define (test-rect rect-module)
  ;; load rect-module
(module test-rect racket
  (require (submod ".." rect-impl1))  
  ;; create rectangle
  (define rr (rect))
  (length rr)
  (width rr)
  ;; check perimeter
)

; this is goign to work in the repl, but not here!
;(require (submod "ex2_3_take2.rkt" test-rect))



;; assuming that rectangles have length and width provided
(module rect-ops racket
  (require (submod ".." rect-impl2))
  (define (perimeter rect)
    (+ (* 2 (length rect))
       (* 2 (width rect))))
  (define (area rect)
    (* (length rect) (width rect)))
)
