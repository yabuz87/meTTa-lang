(=(printElement $expr)
(
    

    )
    )

;linear search in functional paradigm
(= (linear () $target) False)
(= (linear $n $target)
( 
      let*
        (
            ($h (car-atom $n))
            ($t (cdr-atom $n))
        )

       (if(== $target $h)
         True
        (linear $t $target)
        )
))
;!(linear (1 3 4 5) 3) 



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



(= (concatenate () ()) ())
(= (concatenate $x $y)
(
   let* (
      ($h1 (car-atom $x))
      ($h2 (car-atom $y))
      ($t1 (cdr-atom $x))
      ($t2 (cdr-atom $y))
      ($result (concatenate $t1 $t2))
   )
   (if(== $h1 ())
      (concatenate $t2 $t2)
    (cons-atom $h1 $result))
))
;!(concatenate (0 2 5)(1 3 4))

