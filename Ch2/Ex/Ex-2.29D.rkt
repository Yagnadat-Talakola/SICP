#lang racket

; defining binary-mobile using cons operation.
; constructors
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

;selectors
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (cond ((null? branch) 0)
        (else (car branch))))
      

(define (branch-structure branch)
  (cond ((pair? branch) (cdr branch))
        (else branch)))
                       

; total-weight procedure:
(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

; torque procedure:
(define (torque branch)
  (cond ((null? branch) 0)
        (else (* (branch-length branch)
                 (total-weight (branch-structure branch))))))

; balanced? procedure:
(define (balanced? mobile)
  (cond ((not (pair? mobile)) #t)
        ((and (= (torque (left-branch mobile)) (torque (right-branch mobile)))
             (balanced? (branch-structure (left-branch mobile)))
             (balanced? (branch-structure (right-branch mobile)))) #t)
        (else #f)))

; sample data
(define m2 (make-mobile 
             (make-branch 4 6) 
             (make-branch 2 
                          (make-mobile 
                           (make-branch 5 8) 
                           (make-branch 10 4)))))

(define m1 (make-mobile 
             (make-branch 4 6) 
             (make-branch 5 
                          (make-mobile 
                           (make-branch 3 7) 
                           (make-branch 9 8)))))
