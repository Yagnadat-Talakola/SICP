#lang racket

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

(define (prime? n)
  (define (iter count)
    (cond ((= count n) #t)
          ((and (> count 1) (= (remainder n count) 0) (not (= count n))) #f)
          (else (iter (+ count 1)))))
  (iter 1))

; given a postive integer n, find all ordered pairs of distinct positive
; integers i and j, where 1<=j<i<=n, such that i + j is prime.
(define n 6)

(accumulate append
            '()
            (map (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 n)))

; combination of mapping and accumulating with append
(define (flatmap proc seq)
  (accumulate append
              '()
              (map proc seq)))

; filter this sequence of pairs to see whose sum is prime?
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

; generate the sequence of results by mapping over the filtered pairs using the following procedure:
; produces a triple for a given pair (i j) -> (i, j, i+j)
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

; combining all the steps above gives the complete procedure:
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))

; permutations of a set {1, 2, 3} can be computed as follows:
; remove 1 and compute permutations of {2, 3} and join 1 in the beginning. -> {1, 2, 3} {1, 3, 2}
; remove 2 and compute permutations of {1, 3} and join 2 in the beginning -> {2, 1, 3} {2, 3, 1}
; remove 3 and compute permutations of {1, 2} and join 3 in the beginning -> {3, 1, 2} {3, 2, 1}
; combine all the results to get the permutations of {1, 2, 3}

(define (permutations s)
  (if (null? s)
      (list '())
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

; remove procedure returns all the items in the list except for the given item
(define (remove x s)
  (filter (lambda (t) (not (= t x)))
          s))
  
                          
