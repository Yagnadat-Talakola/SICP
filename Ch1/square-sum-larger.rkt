#lang racket


(define (square x)
  (* x x))

(define (larger-of-two x y)
    (if (> x y)
        x
        y))
        
(define (square-sum-larger x y z)
    (if (= (larger-of-two x y) x)
        (+ (square (larger-of-two y z)) (square x))
        (+ (square y) (square (larger-of-two x z)))))