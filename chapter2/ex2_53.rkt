#lang racket

(list 'a 'b 'c)
; => (a b c)
; NO => '(a b c) ... ah, right - lists are always printed as quoted in the repl

(list (list 'george))
; '((george))

(cdr '((x1 x2) (y1 y2)))
; '(y1 y2)
; NO => '((y1 y2)) ... d'uh, I know how cdr/cadr work 

(cadr '((x1 x2) (y1 y2)))
; '(y1 y2)

(pair? (car '(a short list)))
; #f

(memq 'red '((red shoes) (blue socks)))
; #f

(memq 'red '(red shoes blue socks))
; '(red shoes blue socks)