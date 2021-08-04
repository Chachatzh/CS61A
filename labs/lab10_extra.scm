;; Scheme ;;


(define lst
    (list (list 1) 2 (list 3 4) 5))

(define (composed f g)
    (lambda (x) (f (g x))))

(define (remove item lst)
    (cond
        ((null? lst) nil)
        ((= (car lst) item) (remove item (cdr lst)))
        (else (cons (car lst) (remove item (cdr lst))))))


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

(define (no-repeats s)
    (if (null? s)
        nil
        (cons (car s) (no-repeats (remove (car s) (cdr s))))))

(define (substitute s old new)
    (cond
        ((null? s) nil)
        ((pair? (car s)) (cons (substitute (car s) old new) (substitute (cdr s) old new)))
        ((equal? (car s) old) (cons new (substitute (cdr s) old new)))
        (else (cons (car s) (substitute (cdr s) old new)))))


(define (sub-all s olds news)
    (if (null? olds)
        s
        (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news))))