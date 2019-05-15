#lang racket

; Ex-1.11 Recursive process
(define (func n)
  (if (< n 3)
      n
     (+ (func (- n 1))
        (* 2 (func (- n 2)))
        (* 3 (func (- n 3))))))

; Iterative process
(define (func-iter n)
  
  
                 
         