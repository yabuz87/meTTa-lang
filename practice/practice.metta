(=(printElement $expr)
(
    

    )
    )


(= (linear $exp $target)
    (let* 

         (
          ($h (car-atom $exp))
          ($t (cdr-atom $exp))
         )
         
            (if (== $h $target)
                     1  
                (if (== $t ())
                    0
                    (linear $t $target)
                ) 
            )
))

!(linear (1,2,5,6,7) 2)



(= (apply-twice $f $x)($f ($f $x)))


(monica 21 2000 Female)
(paul 22 2400 Male)
(piter 23 6000 Male)
(mic 21 500 Male)
(= (areEqual)
    (match &self ($x $u $v $w) ($x is $w))
)

;!(match &self ($z $u $x $y) ($z is $y))

(= (square $x)(* $x $x))
;!(apply-twice 2 3) 
;!( apply-twice square 3)
(= (sum $x $y)(+ $x $y))
(= (sum3 $x $y $z)(+ $x (sum $y $z)))
!(sum3 1 8 3)

(= (sum4 $x $y $z $w)
(
    (+ (+ $x $y) (+ $z $w))
))
;!(sum4 6 4 3 4)

