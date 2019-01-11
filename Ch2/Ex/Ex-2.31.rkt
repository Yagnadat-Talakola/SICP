#lang racket

; Abstract your answer to Ex-2.30 to produce a procedure tree-map with the property that square-tree could be defined as:
; (define (square-tree tree) (tree-map square tree))
(define (tree-map proc tree)
  (map (lambda (subtree)
         (if (not (pair? subtree))
             (proc subtree)
             (tree-map proc subtree)))
       tree))

; sample-data:
(define sample-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))

; test:
(define (square x) (* x x))
(define (square-tree tree)
  (tree-map square tree))