Conway's Game Of Life
=======================================

This is Conway's game of life in scheme. It's a really simple and naive implementation of the game. I wrote this to learn about modules in Guile scheme...

There is no executable. This program is meant to be played with through the REPL. Load the game using this command on the guile REPL:

```scheme
(load "conway.scm")
```

Then you can create a game:

```scheme
(game
  (list
    (create-coord 0 18)
    (create-coord 1 18)
    (create-coord 2 18)
    (create-coord 2 19)
    (create-coord 1 20)))
```

that's about it!
