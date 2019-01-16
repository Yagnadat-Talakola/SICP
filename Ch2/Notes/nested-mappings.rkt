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
        
        
       
         

  
                          
