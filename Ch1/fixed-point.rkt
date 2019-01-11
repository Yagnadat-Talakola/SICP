#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next-guess (f guess)))
    (if (close-enough? guess next-guess)
        next-guess
        (try next-guess))))
  (try first-guess))


; golden-ratio
(define (phi)
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               1.0))

; infinite-continued-fraction
(define (cont-frac n d k)
  (define (n x) 1)
  (define (d x) 1)
  (define result 0)
  (define (iter count)
    (if (> count k)
        result
        (+ result
           (/ (n count)
              (+ (d count) (iter (+ count 1)))))))
    (iter 1))

;1.38. continued fraction for Euler's e - 2

(define (d x)
  (cond ((= x 1) 1)
        ((= x 2) 2)
        ((= x 3) 1)
        ((= (remainder x 3) 0) expt 2 (+ (quotient x 3) 1))
        (else 1)))

(define (n x)
  1)

; 1.39: tangent function as specified by Lambert. 
(define (tan-cf x k)
  (define (n y)
    (if (= y 1)
        x
        (* x x)))
  (define (d y)
    (- (* 2 y) 1))
  (define result 0)
  (define (iter count)
    (if (> count k)
        result
        (+ result
           (/ (n count)
              (- (d count) (iter (+ count 1)))))))
    (iter 1))
          
        
                