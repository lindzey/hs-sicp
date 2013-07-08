#lang racket

(require "../utils.rkt")

;; code from problem statement
;(define (queens board-size)
;  (define (queen-cols k)  
;    (if (= k 0)
;        (list empty-board)
;        (filter
;         (lambda (positions) (safe? k positions))
;         (flatmap
;          (lambda (rest-of-queens)
;            (map (lambda (new-row)
;                   (adjoin-position new-row k rest-of-queens))
;                 (enumerate-interval 1 board-size)))
;          (queen-cols (- k 1))))))
;  (queen-cols board-size))

;(define rest-of-queens (list 1 1))
;(define col 1)
;(map (lambda (new-row)
;       (adjoin-position new-row col rest-of-queens))
;     (enumerate-interval 1 8))

;(define col 2)
;(map
; (lambda (rest-of-queens)
;   (map (lambda (new-row)
;          (adjoin-position new-row col rest-of-queens))
;        (enumerate-interval 1 8)))
; (list (list 1 1)))


;; definitions to finish the program

;; a queen position is safe if it's not in the same row, col, or diagonal
;; check row
(define (safe? queens new-pos)
  (if (null? queens)
      #t
      (and
           (safe-row? queens new-pos)
           (safe-col? queens new-pos)
           (safe-pos-diag? queens new-pos)
           (safe-neg-diag? queens new-pos))))
       
(define (safe-row? queens new-pos)
  (accumulate-and (map (lambda (queen_pos) (not (eq? (car queen_pos) (car new-pos)))) queens)))
(define (safe-col? queens new-pos)
  (accumulate-and (map (lambda (queen_pos) (not (eq? (cadr queen_pos) (cadr new-pos)))) queens)))
(define (safe-pos-diag? queens new-pos)
  (accumulate-and (map 
                   (lambda (queen-pos) 
                     (not (eq? (+ (car queen-pos) (cadr queen-pos)) 
                               (+ (car new-pos) (cadr new-pos)))))
                   queens)))
(define (safe-neg-diag? queens new-pos)
  (accumulate-and (map 
                   (lambda (queen-pos) 
                     (not (eq? (- (car queen-pos) (cadr queen-pos)) 
                               (- (car new-pos) (cadr new-pos)))))
                   queens)))

(define (accumulate-and l1)
  (if (null? l1)
      #t
      (and (car l1) (accumulate-and (cdr l1)))))
;; TODO: why doesn't this work???
;(define (acc-and l1)
;  (accumulate and #t l1))


;; testing safe?
;   1  2  3  4  5  6  7  8
; 1 Q  -  -  -  -  -  -  -
; 2 -  -  -  -  -  -  -  -
; 3 -  Q  -  -  -  -  -  -
; 4 -  -  -  -  -  -  -  -
; 5 -  -  Q  -  -  -  -  -
; 6 -  -  -  -  -  -  -  -
; 7 -  -  -  -  -  -  -  -
; 8 -  -  -  -  -  -  -  -

(define queen-list (list (list 1 1) (list 3 2) (list 5 3)))
(eq? #t (safe-row? queen-list (list 7 4)))
(eq? #f (safe-row? queen-list (list 3 4)))
(eq? #f (safe-col? queen-list (list 8 1)))
(eq? #t (safe-col? queen-list (list 8 4)))
(eq? #t (safe-pos-diag? queen-list (list 3 4)))
(eq? #f (safe-pos-diag? queen-list (list 4 4)))
(eq? #t (safe-neg-diag? queen-list (list 1 4)))
(eq? #f (safe-neg-diag? queen-list (list 5 5)))
(eq? #f (safe? queen-list (list 1 4)))
(eq? #t (safe? queen-list (list 2 4)))
(eq? #f (safe? queen-list (list 3 4)))
(eq? #f (safe? queen-list (list 4 4)))
(eq? #f (safe? queen-list (list 5 4)))
(eq? #f (safe? queen-list (list 6 4)))
(eq? #t (safe? queen-list (list 7 4)))
(eq? #t (safe? queen-list (list 8 4)))

;; My way, ignoring scaffolding from the book

(define col1-queens
  (map (lambda (x) (append (list (list x 1)) (list))) 
       (enumerate-interval 1 8)))

(define col2-queens
  (filter (lambda (ll) (safe? (cdr ll) (car ll)))
          (flatmap (lambda (qq)
                     (map (lambda (x) (append (list (list x 2)) qq)) 
                          (enumerate-interval 1 8))) col1-queens)))
  
(define col3-queens
  (filter (lambda (ll) (safe? (cdr ll) (car ll)))
          (flatmap (lambda (qq)
                     (map (lambda (x) (append (list (list x 3)) qq)) 
                          (enumerate-interval 1 8))) col2-queens)))

(define (queens board-size)
  (define (queens-helper n)
  (if (= n 1)
      (map (lambda (x) (append (list (list x 1)) (list))) 
           (enumerate-interval 1 board-size))
      (filter (lambda (ll) (safe? (cdr ll) (car ll)))
              (flatmap (lambda (qq)
                         (map (lambda (x) (append (list (list x n)) qq)) 
                              (enumerate-interval 1 board-size))) (queens-helper (- n 1))))))
  (queens-helper board-size))

(define (print-header board-size)
  (fprintf (current-output-port) "   ")
  (define (phh curr-num board-size)
    (fprintf (current-output-port) " ~e " curr-num)
    (if (< curr-num board-size)
        (phh (+ 1 curr-num) board-size)
        '()))
  (phh 1 board-size)
  (newline))

(define (find-col row queen-list)
  (accumulate 
   + 
   0 
   (map (lambda (pp) (if (= row (car pp)) 
                         (cadr pp)
                         0))
        queen-list)))

(define (print-row row board-size queen-list)
  (fprintf (current-output-port) " ~e " row)
  ; find which col is the queen
  (define queen-col (find-col row queen-list))
  (define (print-helper col curr-col board-size)
    (if (> curr-col board-size)
        '()
        (and (if (= col curr-col)
                 (fprintf (current-output-port) " Q ")
                 (fprintf (current-output-port) " - "))
             (print-helper col (+ curr-col 1) board-size))))
  (print-helper queen-col 1 board-size)
  (newline))
  

(define (display queen-list board-size)
  ; print header ('   ' '1' ... board-size) with 2 spaces in between
  (print-header board-size)
  ; print each row
  (map (lambda (row) 
         (print-row row board-size queen-list))
       (enumerate-interval 1 board-size))
)

(define all-queens (queens 8))
(define qq (car all-queens))
qq
(display qq 8)
