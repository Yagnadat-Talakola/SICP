#lang racket

(define (square-list items)
  (define (square x) (* x x ))
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))