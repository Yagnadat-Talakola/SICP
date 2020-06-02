#lang sicp

; right-split procedure
(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter 
                                  (- n 1))))
        (beside painter 
                (below smaller smaller)))))

; split procedure
(define (split p1 p2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split p1 p2) painter (- n 1))))
          (p1 painter
              (p2 smaller smaller))))))

; right-split and up-split defined in-terms of split procedure
(define right-split (split beside below))
(define up-split (split below beside))
    