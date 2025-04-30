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
(Cons (12 (OR (OR B D) (NOT D))) Cons(13(OR A (AND B C) (OR C D)))))))))))))







;selection function 
(partialSum 0)

(= (selection (Cons $x $xs) $random)(
       
        let* (($h (car-atom $x))
              ($t (cdr-atom $x))
                ($sum (+ $partialSum $h))
                 )
        

           (if (> (match &self (partialSum $sum) (+ $sum $h)) $random)
                $x
                (if (== $t Nil)
                    Nil
                   ((selection $xs $random))
            ))
                
                
               
            ) 
        )



;this function is used to select one parent by using routllet selection method 
;!(selection (Cons (2 (AND A (OR B (NOT (OR C D)))))
;(Cons (3 (OR A (AND B C)))
;(Cons (4 (OR (NOT C) (AND A D)))
;(Cons (5 (OR A (OR B (OR C (NOT D)))))
;(Cons (6 (AND (AND A C) (OR C D)))
;(Cons (7 (OR A (AND B C)))
;(Cons (8 (OR (AND A (NOT B) (NOT D))))
;(Cons (9 (AND (OR A B)(AND A (NOT C))))
;(Cons (10 (AND (OR A C) D))
;(Cons (12 (OR (OR B D) (NOT D))) Nil)))))))))) 4)




;random number generator 
(= (random $tot)(
    (random-int &rng 0 (- $tot 1))
))





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

!(crossOver ((OR A (AND B C) OR D) (OR C (AND B C) AND (NOT B)) 3))




;definition of mutation function

;mutation function
(= (mutate ($expr $index))(
    let* (
        ($h (car-atom $expr))
        ($t (cdr-atom $expr))
    )
        (if (== $index 0)
             (if(== $h OR)
                (Cons AND (Cons $t))
                    (if(== $h AND)
                        (Cons OR (Cons $t))
                        (Cons (NOT $h) (Cons $t))
                     )
                    
                    )
           (Cons ($h )(mutate ($t (- $index 1))))
        )))


 ;this one is used to test the mutation function
;!(mutate ((OR A (AND B C) AND C) 0))













;this function is used to find the total score of the population
(= (totalScore (Cons $x $xs))
   (
    if (== $xs Nil)
        (car-atom $x)
        (+ (car-atom $x) (totalScore $xs))
   )
)


;!(totalScore (Cons (2 (AND A (OR B (NOT (OR C D)))))
;(Cons (3 (OR A (AND B C)))
;(Cons (4 (OR (NOT C) (AND A D)))
;(Cons (5 (OR A (OR B (OR C (NOT D)))))
;(Cons (6 (AND (AND A C) (OR C D)))
;(Cons (7 (OR A (AND B C)))
;(Cons (8 (OR (AND A (NOT B) (NOT D))))
;(Cons (9 (AND (OR A B)(AND A (NOT C))))
;(Cons (10 (AND (OR A C) D))
;(Cons (12 (OR (OR B D) (NOT D))) Nil)))))))))))
