#lang racket

; fringe procedure
; @arg: tree (represented as a list)
; @return: list whose elements are all leaves of the tree arranged in left-to-right order.
; (define x (list (list 1 2) (list 3 4)))
; (fringe x) returns (1 2 3 4)
; (fringe (list x x)) returns (1 2 3 4 1 2 3 4)

(define x (list (list 1 2) (list 3 4)))
(define (fringe x)
  (cond ((null? x) '())
        ((pair? (car x))
         (append (fringe (car x)) (fringe (cdr x))))
        (else (cons (car x) (fringe (cdr x))))))