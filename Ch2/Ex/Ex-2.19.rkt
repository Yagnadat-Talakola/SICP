#lang racket

;change-counting program using lists.
;@arg: (amount) input to which change has to be computed.
;@arg: (coin-values) list of denominations. 
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

;no-more? procedure: @arg: List of items
;return true if items list has one or more items, else return false.
(define (no-more? items)
  (if (null? items)
      #t
      #f))

;first-denomination procedure: @arg: List of items
;return the first item in the given argument list.
(define (first-denomination items)
  (car items))

;except-first-denomination procedure:
;return a list with first item removed from the the argument list.
(define (except-first-denomination items)
  (cdr items))