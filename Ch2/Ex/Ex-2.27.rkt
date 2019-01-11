#lang racket

; deep-reverse procedure
; @arg: list
; @return: list with its elements reversed and with all sub-lists deep-reversed as well.
; (define x (list (list 1 2) (list 3 4)))
; (deep-reverse x) returns ((4 3) (2 1))

(define (deep-reverse items)
  (cond ((null? items) '())
        ((pair? (car items))
         (append (deep-reverse (cdr items))
                 (list (deep-reverse (car items)))))
        (else
         (append (deep-reverse (cdr items))
                 (list (car items))))))

;using reverse and map procedures.
(define (deep-reverse-new t) 
   (if (pair? t) 
       (reverse (map deep-reverse-new t)) 
       t)) 