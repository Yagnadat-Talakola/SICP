#lang racket

; procedures defined earlier.
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; fold-right: combines the first element of the sequence with the result of combining all the elements to the right.
(define (fold-right op initial seq)
  (accumulate op initial seq))

; fold-left: combines elements in the opposite direction of fold-right:
(define (fold-left op initial seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial seq))

; define reverse procedures in-terms of fold-right and fold-left.
(define (reverse seq)
  (fold-right (lambda (x y) (append y (list x)))
              '()
              seq))

(define (reverse-alt seq)
  (fold-left (lambda (x y) (append (list y) x))
             '()
             seq))

; test
(reverse (list 1 2 3))
(reverse-alt (list 1 2 3))

