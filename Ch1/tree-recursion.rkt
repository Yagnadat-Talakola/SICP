#lang racket

(define (partition-count num limit)
  (cond ((= num 0) 1)
        ((or (< num 0) (= limit 0)) 0)
        (else
         (+ (partition-count (- num limit) limit)
            (partition-count num (- limit 1))))))




         
        
                   
 