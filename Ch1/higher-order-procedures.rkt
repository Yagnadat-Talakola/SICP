#lang racket

; higher-order procedures

;recursive approach
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n) (+ n 1))
(define (cube n) (* n n n))
(define (identity x) x)

(define (sum-cubes a b)
  (sum cube a inc b))

(define (sum-int a b)
  (sum identity a inc b))

;integral from a to b
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

;Simpson's rule: (TODO)
(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define counter 0)
  (define (next-term x)
    (set! counter (add1 counter))
    (cond ((= counter (- n 1)) (+ a (* n h)))
          ((= (remainder counter 2) 0) (* 2 (+ a (* counter h)))
          ((not (equal? (remainder counter 2) 0)) (* 4 (+ a (* counter h)))))))
  (* (sum f a next-term b)
     (/ h 3)))

;sum computed iteratively
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))
        

; Accumulate takes as arguments the same term and range specifications as sum and product,
; together with a combiner procedure (of two arguments) that specifies how the current term is to be combined
; with the accumulation of the preceding terms and a null-value that specifies what base value to use when the terms run out.

;recursive approach
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) 
                 (accumulate combiner null-value term (next a) next b))))

;iterative approach
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
    result
    (iter (next a) (combiner result (term a)))))
  (iter a 0))

; You can obtain an even more general version of accumulate by introducing the notion of a filter on the terms to be combined.
; That is, combine only those terms derived from values in the range that satisfy a specified condition.
; The resulting filtered-accumulate abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter.

(define (filtered-accumulate combiner null-value term a next b filter?)
  (cond ((> a b) null-value)
        ((filter? (term a))
          (combiner (term a)
                    (filtered-accumulate combiner null-value  term (next a) next b filter?)))
        (else (filtered-accumulate combiner null-value term (next a) next b filter?))))