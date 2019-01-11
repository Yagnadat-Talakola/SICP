#lang racket

; a list can be represented as a sequence of pairs. The last element being an empty list (nil)

(define my-list
  (cons 1
        (cons 2
              (cons 3
                    (cons 4 '())))))
;defining a list.
(define my-list-one (list 1 2 3 4 5))

;first element in the list.
(car my-list-one)

;returns the list of all elements in my-list-one except the first.
(cdr my-list-one)

;returns the second element in my-list-one
(car (cdr my-list-one))

;returns the list of all elements in my-list-one except first and second.
(cdr (cdr my-list-one))

;to return the nth item in a list
(define (item-ref items n)
  (if (= n 0)
      (car items)
      (item-ref (cdr items) (- n 1))))


; return the length of a list of items - iterative approach
(define (length items)
  (define (items-iter a count)
    (if (null? a)
        count
        (items-iter (cdr a) (+ count 1))))
  (items-iter items 0))

; return the length of a list - recursive approach
(define (length-recur items)
  (if (null? items)
      0
      (+ 1 (length-recur (cdr items)))))

; appending two lists to return a new list.
; list1: (1 2 3), list2: (4 5 6) -> (append list1 list2) -> new-list: (1 2 3 4 5 6)  
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
            (append (cdr list1) list2))))

