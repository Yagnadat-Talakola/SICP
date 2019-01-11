#lang racket


; Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order:
; (reverse (list 1 2 3 4) returns a list(4 3 2 1)

;proceures defined earlier.

;gives the last element of the list as a pair.
(define (last-pair items)
  (if (null? (cdr items))
      (cons (car items) '())
      (last-pair (cdr items))))

;returns length of a list.
(define (length-recur items)
  (if (null? items)
      0
      (+ 1 (length-recur (cdr items)))))

; append procdure. Takes two lists and returns a new list that appends both the lists.
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
            (append (cdr list1) list2))))

; define a procedure that removes the last element and returns a new list.
(define (last-elem-remove items)
  (cond ((= (length-recur items) 2)
         (cons (car items) '()))
        ((> (length-recur items) 2)
         (cons (car items) (last-elem-remove (cdr items))))))

; reverse procedure
(define (reverse items)
  (define (item-iter items)
    (cond ((= (length-recur items) 1)
           items)
          (else (append (last-pair items) (item-iter (last-elem-remove items))))))
  (item-iter items))
             
  
    