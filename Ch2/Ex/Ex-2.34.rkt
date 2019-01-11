#lang racket

; horner evaluation procedure:
; @param: x, the value at which the polynomial to be evaluated.
; @param: coefficient sequence, arranged from a0 to an.
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff
                   (* higher-terms x)))
              0
              coefficient-sequence))                