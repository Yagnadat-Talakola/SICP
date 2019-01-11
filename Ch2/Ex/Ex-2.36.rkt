#lang racket

; accumulate-n procedure
; @param: op. Combination procedure to combine elements.
; @param: init. initail value to apply when sequence is processed.
; @param: seqs. list of sequences (list seq1 seq2 seq3..) to which combination needs to be performed. All sequences are of equal length. 
; @return: list of values that are result of performing the combination procedure on each of the sub-sequences.
; (accumulate-n + 0 (list (list 1 2) (list 3 4) (list 5 6)) returns '(9 12)

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

;sample data
(define s (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12)))