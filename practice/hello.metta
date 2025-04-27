((3 (AND A (NOT B) C (OR D))) (2 (AND A (NOT B) C (OR D))))


(Cons (3 (AND A (NOT B) C (OR D))) (Cons (2 (AND A (NOT B) C (OR D))) Nil))

(Cons 1 (Cons 2 (Cons 3 Nil)))
(Cons 2 (Cons 3 Nil))

; How to pick the last element in a list 

; (= (lastEl Nil) Nil)
(= (lastEl (Cons $x $xs))
    (if (== $xs Nil)
        $x
        (lastEl $xs)
    ))

; ! (lastEl (Cons 1 (Cons 2 (Cons 3 Nil))))
(= (lastEl $expr)
    (let*
        (
            ($h (car-atom $expr))
            ($t (cdr-atom $expr))
        )
    (if (== $t ())
        $h
        (lastEl $t)
    )))

! (lastEl (1 2 3))
! (index-atom (0 1 2 3 4) 2)

(Cons (s ex) (Cons (s ex) (Cons (s ex) Nil)))