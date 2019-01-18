#lang racket

; procedures defined earlier:
; prime procedure:
(define (prime? n)
  (define (iter count)
    (cond ((= count n) #t)
          ((and (> count 1) (= (remainder n count) 0) (not (= count n))) #f)
          (else (iter (+ count 1)))))
  (iter 1))

; filter this sequence of pairs to see whose sum is prime?
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

; generate the sequence of results by mapping over the filtered pairs using the following procedure:
; produces a triple for a given pair (i j) -> (i, j, i+j)
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

; accumulate procedure:
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; enumerate-interval procedure:
(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

; flat-map procedure
(define (flatmap proc seq)
  (accumulate append
              '()
              (map proc seq)))

; define a procedure unique-pairs that, given an integer n, generates the sequence of pairs (i, j) with  1<=j<i<=n.
(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

; defining prime-sum-pairs using unique-pairs procedure
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))
