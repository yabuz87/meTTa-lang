
(= (linear $exp $target)
    (let* 

         (
          ($h (car-atom $exp))
          ($t (cdr-atom $exp))
         )
         
            (if (== $h $target)
                     True 
                (if (== $t ())
                    False
                    (linear $t $target)
                ) 
            )
))


!(linear (-1 2 5 6 7) -1)