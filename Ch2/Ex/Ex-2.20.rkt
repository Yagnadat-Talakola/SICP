#lang racket

#|
dotted-tail notation
(define (f x y . z)
  <body>)
  ;(f 1 2 3 4 5 6), then in the body of the function x = 1, y = 2, z = (list 3 4 5 6)

|#

#|
(define (g . w)
  <body>)
;(g 1 2 3 4 5 6), then in the body w = (list 1 2 3 4 5 6)

|#

;append procdure. Takes two lists and returns a new list that appends both the lists.
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
            (append (cdr list1) list2))))

;same-parity procedure:
;@arg: one or more integers
;@return: list of all arguments that have the same even-odd parity as the first argument.
(define (same-parity . elements)
  (define (determine-elem-parity?)
    (if (= (remainder (car elements) 2) 0)
        #t
        #f))
  (define result '())
  (define (element-iter elements result)
    (cond ((null? elements) result)
          ((and (determine-elem-parity?) (= (remainder (car elements) 2) 0))
           (element-iter (cdr elements) (append result (list (car elements)))))
          ((and (not (determine-elem-parity?)) (not (= (remainder (car elements) 2) 0)))
           (element-iter (cdr elements) (append result (list (car elements)))))
          ((and (determine-elem-parity?) (not (= (remainder (car elements) 2) 0)))
           (element-iter (cdr elements) result))
          ((and (not (determine-elem-parity?)) (= (remainder (car elements) 2) 0))
           (element-iter (cdr elements) result))))
  (element-iter elements result))
           
           