(define-module (conway display)
  #:export (show-end-of-game
            show-generation
            filter-on-screen-coords))

(use-modules (conway coord))

(define max-x 60)
(define max-y 20)

(define show-end-of-game
  (lambda ()
    (begin
      (newline)
      (display "game over!")
      (newline))))

(define show-generation
  (lambda (generation)
    (draw-lines (get-lines max-y generation))))

(define draw-lines
  (lambda (lines)
    (cond
      ((null? lines) (newline))
      (else
        (begin
          (draw-line (car lines))
          (draw-lines (cdr lines)))))))

(define draw-line
  (lambda (line)
    (cond
      ((null? line) (newline))
      (else
        (begin
          (display (car line))
          (draw-line (cdr line)))))))

(define get-line
  (lambda (y x generation)
    (cond
      ((<= x 0) (list))
      ((coord-in-list-of-coords? (create-coord x y) generation)
       (append (get-line y (- x 1) generation) (list "+")))
      (else (append (get-line y (- x 1) generation) (list " "))))))

(define get-lines
  (lambda (y generation)
    (cond
      ((<= y 0) (list))
      (else (cons (get-line y max-x generation) (get-lines (- y 1) generation))))))

(define filter-on-screen-coords
  (lambda (generation)
    (filter
      on-screen?
      generation)))

(define on-screen?
  (lambda (coord)
    (and
      (>= (get-x coord) 0)
      (<= (get-x coord) max-x)
      (>= (get-y coord) 0)
      (<= (get-y coord) max-y))))
