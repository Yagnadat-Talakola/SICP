#lang racket

#|
Recursion is a natural tool for dealing with tree structures, since we can often reduce operations on
trees to operations on their branches, which reduce in turn to operations on the branches of the branches,
and so on, until we reach the leaves of the tree.
|#

; count-leaves procedure
; (count-leaves (cons (list (1 2)) 3 4)) returns 4
; @arg: list
; @ return: number of leaves

#|
recurive approach:
count-leaves of empty list of 0.
count-leaves of a leaf is 1.
count-leaves of a tree x is count-leaves of car + count-leaves of the cdr of x.
|#

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))
