#lang racket

; we can represent a set as a list of distinct elements, and we can represent the set of all subsets of the set as a list of lists.
; for example, if the set if (1 2 3), then the set of of all subsets is ( () (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3)).
(define (subsets s)
  (cond ((null? s) (list '()))
        (else (let ((rest (subsets (cdr s))))
                (append rest
                        (map (lambda (x)
                               (cons (car s) x))
                             rest))))))

