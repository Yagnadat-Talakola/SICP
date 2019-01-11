#lang racket

; redefine count-leaves procedure as an accumulation.
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; map processes the tree and returns the list where each element corresponds to number of leaves of each tree element. 
(define (count-leaves tree)
  (accumulate (lambda (x y) (+ x y))
              0
              (map (lambda (x)
                     (cond ((not (pair? x)) 1)
                           (else (count-leaves x))))
                   tree)))
                         
                               
               