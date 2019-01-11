#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (cond ((null? (car seqs)) '())
        (else (cons (accumulate op init (map (lambda (x) (car x))
                                             seqs))
                    (accumulate-n op init (map (lambda (x) (cdr x))
                                               seqs))))))

; matrix operations.
; vector, v(i) of i elements
; matrix m(i, j): '('(1 2 3) '(4 5 6) '(7 8 9))
