#lang racket

;conventional interfaces:

; sum-odd-square procedure:
; @arg: tree
; @return: sum of squares of leaves that are odd.
(define (sum-odd-squares tree)
  (define (square x) (* x x))
  (cond ((null? tree) 0)
        ((not (pair? tree))
         (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))

; even-fibonacci procedure:
; @arg: integer n
; @return: list of all even Fibonacci numbers Fib(k), where k is less than or equal to given integer n.
(define (fib n)
  (cond ((= n 0) 1)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))


(define (even-fib n)
  (define (next k)
    (if (> k n)
        '()
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))

#|

The key to organizing programs so as to more clearly reflect the signal-flow structure is to concentrate on the "signals" that flow from one stage of the process to the next.
If we represent these signals as lists, then we can use list operations to implement the processing at each of the stages.

|#

(define (square x) (* x x))
(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval high low)
  (if (> low high)
      '()
      (cons low (enumerate-interval high (+ low 1)))))

(define (enumerate-tree-leaves tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree-leaves (car tree))
                      (enumerate-tree-leaves (cdr tree))))))

;alernative implementation of sum-odd-squares procedure using sequences as interfaces.
(define (sum-odd-squares-alt tree)
  (accumulate +
              0
              (map square
                   (filter odd?
                           (enumerate-tree-leaves tree)))))

;alternative implementation of even-fib procedure using sequences as interfaces.
(define (even-fib-alt n)
  (accumulate cons
              '()
              (filter even?
                      (map fib
                           (enumerate-interval n 0)))))

; modular construction is a powerful strategy for controlling complexity in engineering design.
; example: construct a list of the squares of the first n + 1 Fibonacci numbers:
(define (list-fib-squares n)
  (accumulate cons
              '()
              (map square
                   (map fib
                        (enumerate-interval n 0)))))

; compute product of odd integers in a sequence.
(define (product-of-square-of-odd-integers sequence)
  (accumulate *
              1
              (map square
                   (filter odd?
                            (enumerate-tree-leaves sequence)))))


         