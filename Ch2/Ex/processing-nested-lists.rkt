#lang sicp

; accumulate procedure
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; count-leaves procedure defined using accumulate
(define (count-leaves t)
  (accumulate + 0 (map (lambda (sub-tree)
                         (if (pair? sub-tree)
                             (count-leaves sub-tree)
                             1))
                       t)))

; (accmulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
; returns (22 26 30)
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
             nil
             (cons (accumulate op init (map (lambda (seq) (car seq))
                                            seqs))
                   (accumulate-n op init (map (lambda (seq) (cdr seq))
                                              seqs)))))
                                            
      
                         

