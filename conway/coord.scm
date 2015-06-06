(define-module (conway coord)
  #:export (create-coord
            get-x
            get-y
            equal-coords?
            coord-in-list-of-coords?
            no-duplicate-coords
            neighbours))

(define create-coord
  (lambda (x y)
    (list x y)))

(define get-x
  (lambda (coord)
    (car coord)))

(define get-y
  (lambda (coord)
    (car (cdr coord))))

(define equal-coords?
  (lambda (c1 c2)
    (and
      (= (get-x c1) (get-x c2))
      (= (get-y c1) (get-y c2)))))

(define coord-in-list-of-coords?
  (lambda (coord list-of-coords)
    (cond
      ((null? list-of-coords) #f)
      ((equal-coords? coord (car list-of-coords)) #t)
      (else (coord-in-list-of-coords? coord (cdr list-of-coords))))))

(define no-duplicate-coords
  (lambda (list-of-coords)
    (cond
      ((null? list-of-coords) (list))
      ((coord-in-list-of-coords? (car list-of-coords) (cdr list-of-coords)) (no-duplicate-coords (cdr list-of-coords)))
      (else (cons (car list-of-coords) (no-duplicate-coords (cdr list-of-coords)))))))

(define neighbours
  (lambda (coord)
    (list
      (create-coord (get-x coord) (+ (get-y coord) 1))
      (create-coord (get-x coord) (- (get-y coord) 1))
      (create-coord (+ (get-x coord) 1) (get-y coord))
      (create-coord (- (get-x coord) 1) (get-y coord))
      (create-coord (+ (get-x coord) 1) (+ (get-y coord) 1))
      (create-coord (- (get-x coord) 1) (- (get-y coord) 1))
      (create-coord (+ (get-x coord) 1) (- (get-y coord) 1))
      (create-coord (- (get-x coord) 1) (+ (get-y coord) 1)))))
