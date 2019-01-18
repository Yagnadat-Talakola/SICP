#lang racket

; define a procedure to find all ordered triplets of distinct positive integers i, j and k less than or equal to a given integer n that sum to a given integer s.

; procedures defined earlier:
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

; remove procedure returns all the items in the list except for the given item
(define (remove x s)
  (filter (lambda (t) (not (= t x)))
          s))
  
; checks to see if the sum of list elements equals k
(define (check-sum-triples? list k)
  (cond ((= (+ (car list) (cadr list) (caddr list)) k) #t)
        (else #f)))

; ordered-triples procedure:
(define (ordered-triples n s)
  (filter (lambda (x)
            (check-sum-triples? x s))
          (flatmap (lambda (x)
                     (flatmap (lambda (y)
                                (map (lambda (z)
                                       (list x y z))
                                     (remove y (remove x (enumerate-interval 1 n)))))
                              (remove x (enumerate-interval 1 n))))
                   (enumerate-interval 1 n))))
  