#lang racket

#|
A binary mobile consists of two branches, a left branch and a right branch. Each binary is a rod of a certain length, from which hangs
either a weight or another binary mobile. We can represent a binary mobile using compound data by constructing it from two branches.
|#

(define (make-mobile left right)
  (list left right))

;A branch is constructed from a length(must be a number) together with a structure, which may be either a number(representing a simple weight) or another mobile:

(define (make-branch length structure)
  (list length structure))

; 1. Write corresponding selectors left-branch, right-branch, which returns the branches of a mobile, and branch-length and branch-structure which returns the components of a branch.
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cond ((null? branch) 0)
        (else (car (cdr branch)))))
        
;sample data:
(define left-branch-data (make-branch 2 8))

(define right-branch-data (make-branch 2 4))

(define mobile-data (make-mobile left-branch-data right-branch-data))

; total-weight procedure:
; @arg: mobile
; @return: total weight of a mobile.
(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile) 
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

; balanced? procedure:
; @arg: binary mobile
; @return: #t if balanced, #f otherwise.
; (= (torque left-branch) (torque right-branch))
(define (balanced? mobile)
  (cond ((not (pair? mobile)) #t)
        ((null? mobile) 0)
        ((and (= (torque (left-branch mobile)) (torque (right-branch mobile)))
             (balanced? (branch-structure (left-branch mobile)))
             (balanced? (branch-structure (right-branch mobile)))) #t)
        (else #f)))

; torque procedure:
; @arg: branch
; @return: (* (length-of-branch) (weight-of-branch))
(define (torque branch)
  (cond ((null? branch) 0)
        (else (* (branch-length branch)
                 (total-weight (branch-structure branch))))))

;sample data to test balanced? and torque.
(define m1 (make-mobile 
             (make-branch 4 6) 
             (make-branch 5 
                          (make-mobile 
                           (make-branch 3 7) 
                           (make-branch 9 8)))))

(define m2 (make-mobile 
             (make-branch 4 6) 
             (make-branch 2 
                          (make-mobile 
                           (make-branch 5 8) 
                           (make-branch 10 4)))))
  