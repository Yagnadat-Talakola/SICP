#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
             nil
             (cons (accumulate op init (map (lambda (seq) (car seq))
                                            seqs))
                   (accumulate-n op init (map (lambda (seq) (cdr seq))
                                              seqs)))))

; matrix operations

; dot-product of two vectors
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

; matrix-*-vector of a matrix, m and vector, v.
(define (matrix-*-vector m v)
  (map (lambda (vect) (dot-product vect v))
                      m))

; transpose of a matrix
(define (transpose mat)
  (accumulate-n cons nil mat))

; matrix-*-matrix multiplication
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (vect)
           (matrix-*-vector cols vect))
           m)))


