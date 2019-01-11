#lang racket

(provide sqrt)

(define (square x)
  (* x x))

(define (abs x)
  (cond ((< x 0) (- x))
        ((= x 0) 0)
        ((> x 0) x)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improv guess x)
                 x)))

(define (average x y)
  (+ (/ x 2)
     (/ y 2)))

(define (improv guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0001))

(define (sqrt x)
  (sqrt-iter 1.0 x))


;nesting auxiliary definitions within the scope of SQRT - lexical scoping.
;since x is bound in the definition of SQRT, the auxiliary definitions are
;in the scope of x.
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
