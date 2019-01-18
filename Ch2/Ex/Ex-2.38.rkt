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

; test
(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
(fold-right list '() (list 1 2 3))
(fold-left list '() (list 1 2 3))

; give a property that op should satisfy to gurantee that fold-right and fold-left will produce the same values for any sequence.
; op should produce the same result irrespective of the order of arguments passed to it: (op x y) should be the same as (op y x)
; for instance,
(fold-right * 1 (list 1 2 3))
(fold-left * 1 (list 1 2 3))
; both produce the same result since: (* 1 2) same as (* 2 1)
(fold-left * 1 (list 1 2 3))
; (* (* 1 1) '(2 3)) -> (* (*1 2) '(3)) -> (* 2 3) -> 6
(fold-right * 1 (list 1 2 3))
; (* 1 (* 2 (* 3 1))) -> 6
            
