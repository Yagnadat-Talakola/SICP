#lang racket

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next-guess (f guess)))
    (if (close-enough? guess next-guess)
        next-guess
        (try next-guess))))
  (try first-guess))

;square root
(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

;cube root
(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (* square y))))
               1.0))

;derivative of g at x.
(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (cube x)
  (* x x x))

; newton-transform: f(x) = x - (g(x) / Dg(x)) 
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x))))) 
