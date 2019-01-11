#lang racket

; accumulate procedure:
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; map proceudre defined with accumulate procedure
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

; append procedure defined using accumulate procedure:
(define (append-alt seq1 seq2)
  (accumulate cons
              seq2
              seq1))

; length procedure defined using accumulate procedure:
(define (length-alt sequence)
  (accumulate (lambda (x y)
                (if (not (null? x))
                    (add1 (length-alt (cdr sequence)))
                    0))
              0
              sequence))
                          