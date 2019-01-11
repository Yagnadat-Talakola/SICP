#lang racket

;square-list procedure:
;@arg: list
;@return: list of squares of the numbers.
(define (square-list items)
  (if (null? items)
      '()
      (cons (* (car items) (car items))
            (square-list (cdr items)))))

;using map:
(define (square-list-new items)
  (map (lambda (x) (* x x )) items))