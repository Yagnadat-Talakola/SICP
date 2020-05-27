#lang sicp

(define a (list 1 2 3 4))

(define b (cons 1
                (cons 2
                      (cons 3
                            (cons 4 nil)))))
; scale-list procedure
(define (scale-list factor list)
  (if (null? list)
      nil
      (cons (* factor (car list))
            (scale-list factor
                        (cdr list)))))
; map procedure
(define (map p l)
  (if (null? l)
      nil
      (cons (p (car l))
            (map p (cdr l)))))
               

; scale-list procedure using map
(define (scale-list-proc factor list)
  (map (lambda (x) (* x factor)) list))

;for-each procedure
(define (for-each proc list)
  (cond ((null? list) "done")
        (else (proc (car list))
              (for-each proc (cdr list)))))

; append procedure
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

         
; length procedure
(define (length l)
  (if (not (pair? l)) 0
      (+ 1 (length (cdr l)))))

; count-leaves procedure
(define (count-leaves l)
  (cond  ((null? l) 0)
         ((not (pair? l)) 1)
         (else (+ (count-leaves (car l))
                  (count-leaves (cdr l))))))

; fringe procedure
(define (fringe l)
  (cond ((null? l) nil)
        ((not (pair? l)) (list l))
        (else (append (fringe (car l))
                      (fringe (cdr l))))))

; last-pair
(define (last-pair l1)
  (cond ((null? (cdr l1)) (list (car l1)))
        (else (last-pair (cdr l1)))))

; reverse
(define (reverse items) 
   (if (null? (cdr items)) 
       items 
       (append (reverse (cdr items)) 
               (cons (car items) nil)))) 

; square-list procedure using primitive operations
(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items)
               (car items))
            (square-list (cdr items)))))

; square-list using map
(define (square-list-map list)
  (map (lambda (x) (* x x)) list))

; square-list implemented in iterative manner. 
(define (square-list-iter items)
  (define (square x) (* x x))
  (define (iter things answer)
    (if (null? things)
        (reverse answer)
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

; (deep-reverse (list (list 1 2) (list 3 4) -> ((4 3) (2 1))
(define (deep-reverse l)
  (map reverse (reverse l)))
  


        


                  
               
                    
                 