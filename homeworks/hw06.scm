;;;;;;;;;;;;;;;
;; Questions ;;
;;;;;;;;;;;;;;;

; Scheme

(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s)))

(define (caddr s)
  (car (cdr (cdr s))))

(define (unique s)
    (if (null? s)
        s
        (let 
            ((sub-s (filter (lambda (x) (not (equal? x (car s)))) s)))
            (cons (car s) (unique sub-s)))))

(define (cons-all first rests)
  (map (lambda (rest) (cons first rest)) rests))

;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
    (let
        ((first (car denoms))
        (rest (cdr denoms)))
        (cond
            ((<= total 0) nil)
            ((< total first) (list-change total rest))
            ((null? rest) (cons first (list-change (- total first) denoms)))
            (else (list 
                (cons first (list-change (- total first) denoms)) 
                (list-change total rest))))))

; Tail recursion

(define (replicate x n)
    (define (replicate-tail x n s)
        (if (= n 0)
            s
            (replicate-tail x (- n 1) (cons x s))))
    (replicate-tail x n '()))

(define (accumulate combiner start n term)
    (if (= n 1)
        (combiner start (term 1))
        (combiner (term n) (accumulate combiner start (- n 1) term))))

(define (accumulate-tail combiner start n term)
    (define (fn combiner start n term result)
        (if (= n 0)
            (combiner start result)
            (fn combiner start (- n 1) term (combiner result (term n)))))
    (fn combiner start (- n 1) term (term n)))

; Macros

(define-macro (list-of map-expr for var in lst if filter-expr)
    (let
        ((x (list var)))
        (list 'map (list 'lambda x map-expr) (list 'filter (list 'lambda x filter-expr) lst))))