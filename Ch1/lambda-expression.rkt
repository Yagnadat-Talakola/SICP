#lang racket

#|
; to express the below function:
; f(x,y) = x(1+xy)^2 + y(1−y) + (1+xy)(1−y)
; a = 1 + xy
; b = 1 - y
; f(x, y) = x(a^2) + yb + ab

|#

; without lambda 
(define (f x y)
  (define f-helper a b)
  (+ (* x (* a a))
     (* y b)
     (* a b))
  (f-helper (+ 1 (* x y))
            (- 1 y)))

; using lambda expressions
(define (f x y)
  ((lambda (a b)
    (+ (* x (* a a))
       (* y b)
       (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

; using let as syntactic sugar for lambda expression
(define (f x y)
  (let ((a (+ 1(* x y)))
        (b (- 1 y)))
    (+ (* x (* a a))
       (* y b)
       (* a b))))

#|

general form of let expression is:
(let ((<var1> <exp1>)
      (<var2> <exp2>)
      ...
      (<varN> <expN>))
   <body>)
;The body of the let is evaluated with these names bound as local variables
;which is exactly below:
((lambda (<var_1> ... <var_n>)
    <body>)
  <exp_1>
  ...
  <exp_n>)


|#
    
