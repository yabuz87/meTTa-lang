
(Cons (2 (AND A (OR B (NOT (OR C D)))))
(Cons (3 (OR A (AND B C)))
(Cons (4 (OR (NOT C) (AND A D)))
(Cons (5 (OR A (OR B (OR C (NOT D)))))
(Cons (6 (AND (AND A C) (OR C D)))
(Cons (7 (OR A (AND B C)))
(Cons (8 (OR (AND A (NOT B) (NOT D))))
(Cons (9 (AND (OR A B)(AND A (NOT C))))
(Cons (10 (AND (OR A C) D))
(Cons (12 (OR (OR B D) (NOT D))) Nil))))))))))

;this function is used to find the total score of the population
(= (totalScore (Cons $x $xs))
   (
    if (== $xs Nil)
        (car-atom $x)
        (+ (car-atom $x) (totalScore $xs))
   )
)
(= (random $tot)(
    (random-int &rng 1 $tot)
))



(= (selection ((Cons $x $xs) $random))(
       
        let* (
            
            ($h (car-atom $x))
            ($t (cdr-atom $x))
            ($p  (0)))
        (if (< $rand $p)
            $x 
            ((selection ($xs $random)) (+ $p $h))
        )
))
!(selection ((Cons (2 (AND A (OR B (NOT (OR C D)))))
(Cons (3 (OR A (AND B C)))
(Cons (4 (OR (NOT C) (AND A D)))
(Cons (5 (OR A (OR B (OR C (NOT D)))))
(Cons (6 (AND (AND A C) (OR C D)))
(Cons (7 (OR A (AND B C)))
(Cons (8 (OR (AND A (NOT B) (NOT D))))
(Cons (9 (AND (OR A B)(AND A (NOT C))))
(Cons (10 (AND (OR A C) D))
(Cons (12 (OR (OR B D) (NOT D))) Nil)))))))))) 14))