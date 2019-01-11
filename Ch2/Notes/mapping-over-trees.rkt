#lang racket

; scale-tree procedure:
; @arg: tree (whose leaves are numbers)
; @arg: factor
; @return: tree of same shape, where each number is multipled by the factor.

(define (scale-tree factor tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale-tree factor (car tree))
                    (scale-tree factor (cdr tree))))))

;sample data:
(define sample-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

; defining scale-tree using map;
(define (scale-tree-alt factor tree)
  (map (lambda(sub-tree)
         (if (pair? sub-tree)
             (scale-tree-alt factor sub-tree)
             (* factor sub-tree)))
       tree))