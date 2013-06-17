#lang racket

;; code from the problem statement
(define (make-mobile left right)
  (cons left right))
  ;(list left right))

; here, structure may be another mobile or just a number returning weight
(define (make-branch length structure)
  (cons length structure))
 ;(list length structure))

;; ********************
;; example mobiles for testing
(define branch_1_1 (make-branch 1 1))
(define branch_2_1 (make-branch 2 1))
(define branch_2_4 (make-branch 2 4))

(define sub1 (make-mobile branch_1_1
                          branch_1_1))
(define sub2 (make-mobile branch_2_1
                          branch_2_1))
(define sub3 (make-mobile branch_2_1
                          branch_1_1))
;; These are balanced
(define mobile1 (make-mobile (make-branch 3 sub1)
                             (make-branch 3 sub1)))
(define mobile2 (make-mobile (make-branch 2 4)
                             (make-branch 4 sub2)))
;; and this is unbalanced
(define mobile3 (make-mobile (make-branch 2 sub3)
                             (make-branch 4 sub1)))
;; ********************

;; Part a - accessors
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cdr mobile))
 ;(car (cdr mobile)))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cdr branch))
 ;(car (cdr branch)))

;; Part b - total weight
;; Simply sums up the values of all structure weights
(define (atom? x)
  (and (not (null? x)) (not (pair? x))))
(define (total-weight mobile)
  (if (atom? mobile)
      mobile
      (+ (total-weight (branch-structure (left-branch mobile)))
         (total-weight (branch-structure (right-branch mobile))))))

;; Testing code
(= 4 (total-weight mobile1))
(= 6 (total-weight mobile2))
(= 4 (total-weight mobile3))

;; Part c - testing balance
(define (balanced? mobile)
  (if (atom? mobile)
      #t
      (let ((len1 (branch-length (left-branch mobile)))
            (len2 (branch-length (right-branch mobile)))
            (w1 (total-weight (branch-structure (left-branch mobile))))
            (w2 (total-weight (branch-structure (right-branch mobile)))))
        (and (= (* len1 w1) (* len2 w2))
             (balanced? (branch-structure (left-branch mobile)))
             (balanced? (branch-structure (right-branch mobile)))))))
; testing code
(balanced? mobile1) 
(balanced? mobile2) 
(not (balanced? mobile3)) 

;; Part d - changing the representation of the mobile only required 
;; changing the accessor functions from part a, and nothing from b or c
