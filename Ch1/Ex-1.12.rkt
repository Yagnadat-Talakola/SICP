#lang racket

; compute the element of Pascal's triangle at a given row and column
; 1
; 1 1
; 1 2 1
; 1 3 3 1
; 1 4 6 4 1

(define (pascal row col)
  (cond ((= col 0) 1)
        ((= col row) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))


; sum procedure as an iterative process.
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (cube x) (* x x x))
(define (inc x) (+ x 1))
(define (identity x) x)

; product procedure of a function computed for a range of values from a to b.
(define (product f a next b)
  (if (> a b)
      1
      (* (f a)
         (product f (next a) next b))))

; factorial in-terms of product procedure
(define (factorial b)
  (product identity 1 inc b))

; factorial as an iterative process
(define (fact-iter b)
  (define (iter count result)
    (if (> count b)
        result
        (iter (+ count 1) (* result count))))
  (iter 1 1))

; accumulate procedure as an abstraction for combining terms
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))
; accumulate procedure as an iterative process
(define (accumulate-iter combiner null-value term a next b)
  (define (iter x result)
    (if (> x b)
        result
        (iter (next x) (combiner result (term x)))))
  (iter a null-value))

