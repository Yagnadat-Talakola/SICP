#lang racket

#|

The half-interval method is a simple but powerful technique for finding roots of an equation f(x)=0 where f is a continuous function.
The idea is that, if we are given points a and b such that f(a)<0<f(b), then f must have at least one zero between a and b.
To locate a zero, let x be the average of a and b and compute f(x). If f(x)>0, then f must have a zero between a and x.
If f(x)<0, then f must have a zero between x and b. Continuing in this way, we can identify smaller and smaller intervals on which f must have a zero.
When we reach a point where the interval is small enough, the process stops. Since the interval of uncertainty is reduced by half at each step of the process,
the number of steps required grows as Θ(log(L/T)), where L is the length of the original interval and T is the error tolerance
(that is, the size of the interval we will consider “small enough”)

|#

(define (search f neg-point pos-point)
  (let ((mid-point (avg neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        mid-point
        (let ((test-value (f mid-point)))
          (cond ((positive? test-value)
                 (search f neg-point mid-point))
                ((negative? test-value)
                 (search f mid-point pos-point))
                (else mid-point))))))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (avg x y)
  (/ (+ x y) 2))

;to make sure we have f(a) and f(b) with opposite signs for the purpose of (search f neg-point pos-point)
(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (positive? a-value) (negative? b-value))
           (search f b a))
          ((and (negative? a-value) (positive? b-value))
           (search f a b))
          (else "values are not of opposite sign" a b))))