#lang racket

;linear-iteration. time = O(x), space = O(1)
(define (+ x y)
  (if (= x 0)
      y
      (+ ((-1+ x) (1+ y)))))

;linear-recursion. time = O(x), space = O(x)
(define (+ x y)
  (if (= x 0)
      y
      (1+ (+ (-1+ x) y))))