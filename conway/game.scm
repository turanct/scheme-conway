(define-module (conway game)
  #:export (game))

(use-modules (conway generation) (conway display))

(define game
  (lambda (generation)
    (cond
      ((null? generation) (show-end-of-game))
      (else
        (begin
          (show-generation generation)
          (usleep 50000)
          (game (filter-on-screen-coords (next-generation generation))))))))
