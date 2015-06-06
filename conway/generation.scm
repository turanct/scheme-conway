(define-module (conway generation)
  #:export (next-generation))

(use-modules (conway coord))

(define neighbours-in-generation
  (lambda (cell generation)
    (filter
      (lambda (neighbour) (coord-in-list-of-coords? neighbour generation))
      (neighbours cell))))

(define cell-lives-on
  (lambda (cell generation)
    (let ((neighbours (neighbours-in-generation cell generation)))
      (or
        (= (length neighbours) 2)
        (= (length neighbours) 3)))))

(define cell-is-born
  (lambda (coord generation)
    (let ((neighbours (neighbours-in-generation coord generation)))
      (= (length neighbours) 3))))

(define consider-newborn-cells
  (lambda (generation)
    (cond
      ((null? generation) (list))
      (else
        (filter
          (lambda (coord) (not (coord-in-list-of-coords? coord generation)))
          (no-duplicate-coords
            (append
              (neighbours (car generation))
              (consider-newborn-cells (cdr generation)))))))))

(define next-generation
  (lambda (generation)
    (append
      (filter
        (lambda (cell) (cell-lives-on cell generation))
        generation)
      (filter
        (lambda (coord) (cell-is-born coord generation))
        (consider-newborn-cells generation)))))
