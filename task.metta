;random population of 10 individuals

;population_size = 10
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


;selection function 




;cross over function
(= (crossOver ($expr1 $expr2 $index))(
   let* (($h1 (car-atom $expr1))
        ($t1 (cdr-atom $expr1))
        ($h2 (car-atom $expr2))
        ($t2 (cdr-atom $expr2))
        )

        (if (== $index 0)
        (
            Cons $h2 (Cons $t1)
            
        )
           (Cons $h1 (crossOver ($t1 $t2 (- $index 1))))
        )

      
))

!(crossOver ((OR A (AND B C)) (OR C (AND B C)) 1))



;mutation function
(= (mutate ($expr $index))(
    let* (
        ($h (car-atom $expr))
        ($t (cdr-atom $expr))
    )
        (if (== $index 0)
             (if(== $h (AND A B))
                (Cons (OR A B) (Cons $t))
                (
                    if(== $h AND)
                     (Cons (OR) (Cons $t))
                     (if(== $h OR)
                        (Cons (AND) (Cons $t)))
                        (Cons (OR A (NOT B)) (Cons $t))
                )
             )
           (Cons $h (mutate ($t (- $index 1))))
        )))

(= (take $expr) $expr)
!(mutate ((OR A (AND B C)) 1))


