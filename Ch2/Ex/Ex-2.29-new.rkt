#lang sicp

 ; Ex-2.29
; constructor for mobile
(define (make-mobile left right)
  (cons left right))

; constructor for branch
(define (make-branch length structure)
  (cons length structure))

; selector for left and right branches
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

; selectors for branch properties
(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

(define (torque branch)
  (* (total-weight (branch-structure branch))
     (branch-length branch)))

(define (mobile-balanced? mobile)
  (cond ((not (pair? mobile)) mobile)
        ((and (= (torque (left-branch mobile))
                 (torque (right-branch mobile)))
              (mobile-balanced? (branch-structure (left-branch mobile)))
              (mobile-balanced? (branch-structure (right-branch mobile))))
         #t)
        (else #f)))

(define m2 (make-mobile 
             (make-branch 4 6) 
             (make-branch 2 
                          (make-mobile 
                           (make-branch 5 8) 
                           (make-branch 10 4))))) 