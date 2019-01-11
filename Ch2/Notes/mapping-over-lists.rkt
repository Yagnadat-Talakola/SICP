#lang racket

(define (scale-list items factor)
  (if (null? items)
      '()
      (cons (* (car items) factor)
            (scale-list (cdr items) factor))))

; map procedure:
; @arg: procedure of one argument.
; @arg: list
; @return: list of results produced by applying the procedure to each element of the list.
(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items)))))

;defining scale-list in terms of map
(define (scale-list-new items factor)
  (map (lambda (x) (* x factor))
       items))