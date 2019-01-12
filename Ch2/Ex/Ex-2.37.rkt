#lang scheme

; procedures defined earlier.
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (cond ((null? (car seqs)) init)
        (else (cons (accumulate op init (map car seqs))
                    (accumulate-n op init (map cdr seqs))))))

; matrix operations.

;sample data
(define v1 (list 1 2 3))
(define v2 (list 4 5 6))
(define matrix (list (list 1 2 3) (list 5 6 7) (list 9 10 11)))
(define matrix1 (list (list 1 2 3) (list 5 6 7) (list 9 10 11)))

; dot-product between two vetors
(define (dot-product w v)
  (accumulate + 0 (map * w v)))

; test
(dot-product v1 v2)

; matrix-*-vector procedure:
(define (matrix-*-vector m v)
  (map (lambda (x)
               (accumulate + 0 (map * v x)))
       m))

; test
(matrix-*-vector matrix v1)

; transpose procedure:
; (transpose '('(1 2 3) '(4 5 6) '(7 8 9)) -> '('(1 4 7) ('2 5 8) '(3 6 9))
(define (transpose mat)
  (accumulate-n cons '() mat))

; test
(transpose matrix)

; matrix-*-matrix procedure:
; multiplication of two matrices. If mat1 is of size m*n and mat2 is of n*p then resulting matrix will be of size m*p.
; perform transpose of second matrix and perform matrix-*-vector between each row of mat1 with mat2 and combine using cons.
(define (matrix-*-matrix mat1 mat2)
  (let ((cols (transpose mat2)))
    (map (lambda (x)
           (accumulate cons '() (matrix-*-vector cols x)))
         mat1)))

; test
(matrix-*-matrix matrix matrix1)