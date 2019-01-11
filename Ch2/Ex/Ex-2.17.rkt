#lang racket

;Define a procedure last-pair that returns the list that contains only the last element of a given (nonempty) list:
; (1 2 3 4) returns (4)
(define (last-pair items)
  (if (null? (cdr items))
             (cons (car items) '())
             (last-pair (cdr items))))
  