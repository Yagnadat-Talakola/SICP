#lang racket

;for-each procedure
; @arg: procedure to apply to each element of the list from left to right.
; @arg: list
; @return: something arbitrary
(define (for-each proc items)
  (cond ((null? items)
         #t)
        (else (proc (car items))
              (for-each proc (cdr items)))))