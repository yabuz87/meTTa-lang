;(= linear(($expr $target))
;  (if (== $expr Nil)
;      0
;      (let* (
;          ($h (car-atom $expr))
;          ($g (cdr-atom $expr))
;        )
;        (if (== $h $target)
;            1
;            (linear ($g $target))
;        )
;      )
;  )
;)

;! (linear((Cons 1(Cons 4(Cons 6(Cons 0(Cons 10 Nil))))) $val 4)
;)


(= (hello $A)(hello $A is accepted as input atom))

;!(hello 5)

(= (addOne $h)(* $h 2))

;!(addOne -1)

(= (check $h)(
  (if(> $h 2)
    1
    2

)))

;! (check 3)


(= (add $a $b) (+ $a $b))
;!(add 1 2)

(= (linear ($expr $target))
   (
    (let* (
       ($h (car-atom $expr))
       ($t (cdr-atom $expr))
     )
     (if (== $h $target)
         True
          
          (if (== $t ())
              False
              (linear ($t $target))
          )
       
     )
     )
     
      
     
   
))


! (linear(1,2,3,4,5) 2) 
  
;!(add 1 2)

