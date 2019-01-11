#lang racket

(require "sqrt-procedure.rkt")

;make-point is the constructor of point objects. Each point is of the form (x, y) pair where x and y are integers.
(define (make-point x y)
  (cons x y))

;x-point is the x coordinate of the point object.
(define (x-point point)
  (car point))

;y-point is the y coordinate of the point object.
(define (y-point point)
  (cdr point))

;segment object is pair of point objects.
(define (make-segment point1 point2)
  (cons point1 point2))

;start-segment is the point of the starting coordinates of a line-segment.
(define (start-segment line-segment)
  (car line-segment))

;end-segment is the point of ending coordinates of a line-segment.
(define (end-segment line-segment)
  (cdr line-segment))

;mid-point-segment is the mid-point of a line-segment.
(define (mid-point-segment line-segment)
  (let ([starting-segment (start-segment line-segment)]
        [ending-segment (end-segment line-segment)])
    (define x-midpoint (/ (+ (x-point starting-segment)
                             (x-point ending-segment))
                          2))
    (define y-midpoint (/ (+ (y-point starting-segment)
                             (y-point ending-segment))
                          2))
    (make-point x-midpoint y-midpoint)))

;print point
(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

;constructing rectangles with points.
(define (make-rect point1 point2 point3 point4)
  (let ([line-segA (make-segment point1 point2)]
        [line-segB (make-segment point2 point3)]
        [line-segC (make-segment point3 point4)]
        [line-segD (make-segment point4 point1)])
    (cons (cons line-segA line-segB) (cons line-segC line-segD))))

;set selectors for rectangle object.
(define (get-linesegA rectangle)
  (car (car rectangle)))

(define (get-linesegB rectangle)
  (cdr (car rectangle)))

(define (get-linesegC rectangle)
  (car (cdr rectangle)))

(define (get-linesegD rectangle)
  (cdr (cdr rectangle)))

;compute length of a line-segment.
(define (compute-length line-seg)
  (define (square x)
    (* x x))
  (sqrt (+ (square (- (x-point (start-segment line-seg)) (x-point (end-segment line-seg))))
           (square (- (y-point (start-segment line-seg)) (y-point (end-segment line-seg)))))))

;compute perimeter of a rectangle given 4 points.
(define (rect-attr point1 point2 point3 point4)
  (let ([rect (make-rect point1 point2 point3 point4)])
    (define line-segA (get-linesegA rect))
    (define line-segB (get-linesegB rect))
    (define length-rect (compute-length line-segA))
    (define breadth-rect (compute-length line-segB))
    (define peri-rect (* 2 (+ length-rect breadth-rect)))
    (define area-rect (* length-rect breadth-rect))
    (display 'area)
    (newline)
    (display area-rect)
    (newline)
    (display 'perimeter)
    (newline)
    (display peri-rect)))
    

    

                             
                         

