#lang racket

;representing rational numbers using pairs.

(define (make-rat n d)
  (cons n d))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (print-rat x)
  (display (numer x))
  (display '/)
  (display (denom x))
  (newline))

;arithematic opertions on two rational numbers
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))


#|

Define a better version of make-rat that handles both positive and negative arguments.
Make-rat should normalize the sign so that if the rational number is positive,
both the numerator and denominator are positive, and if the rational number is negative, only the numerator is negative.

|#

(define (make-rat-one n d)
  (define (abs x)
    (cond ((>= x 0) x)
          ((< x 0) (- x))))
  (cond ((or (and (>= n 0) (> d 0)) (and (< n 0) (< d 0)))
      (print-rat (cons (abs n) (abs d))))
        (else
         (display '-)
         (print-rat (cons (abs n) (abs d))))))