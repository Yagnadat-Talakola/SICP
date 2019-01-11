#lang racket


;procedural representation of pairs. If z is (cons x y), then we have shown that (car z) is x and (cdr z) is y.
; (cons x y) returns dispatch procedure. dispatch returns x if 0 is provided as argument, returns y if 1 is provided as argument.
(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1 -- CONS" m))))
  dispatch)

(define (car z) (z 0))

(define (cdr z) (z 1))


; alternate version.
(define (cons-alt x y)
  (lambda (m) (m x y)))

(define (car-alt z)
  (z (lambda (p q) p)))

(define (cdr-alt z)
  (z (lambda (p q) q)))


;Ex 2.5. Representing pairs of non-negative integers. TODO
(define (non-neg-pair a b)
  (lambda (x) (x a b (* (expt 2 a) (expt 3 b)))))

(define (non-neg-car z)
  (z (lambda (p q r) p)))

(define (non-neg-cdr z)
  (z (lambda (p q r) q)))

; Ex:2.6
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; one is (add-1 zero)
(define one (lambda (f) (lambda (x) (f x))))

;two is (add-1 one)
(define two (lambda (f) (lambda (x) (f (f x)))))

;direct definition of addition procedure. Assuming a and b are non-negative integers.
(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x))))) 
            