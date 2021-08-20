(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define multiples-of-three
    (cons-stream 3 (map-stream (lambda (x) (+ x 3)) multiples-of-three)))

(define (rle s)
    (define (count s f c) ; f for first item, c for the counts of first item
        (cond 
            ((null? s) (cons-stream (list f c) nil))
            ((equal? f (car s)) (count (cdr-stream s) f (+ c 1)))
            (else (cons-stream (list f c) (count s (car s) 0)))))
    (if (null? s)
        nil
        (count s (car s) 0)))