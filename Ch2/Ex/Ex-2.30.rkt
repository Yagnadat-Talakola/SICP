#lang racket

; square-tree procedure using higher-order procedure
; @arg: tree
; @return: tree where each element of the tree is squared.
(define (square-tree tree)
  (define (square x) (* x x))
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (square sub-tree)))
       tree))

; square-tree procedure without using higher-order procedures.
(define (square-tree-alt tree)
  (define (square x) (* x x))
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree-alt (car tree))
                    (square-tree-alt (cdr tree))))))

; sample-data:
(define sample-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))