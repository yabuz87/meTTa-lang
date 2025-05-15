(= (length Nil)0)
(= (length (Cons $x $xs))(
  + 1 (length $xs)
))
;!(length(Cons 1 (Cons 3 (Cons 3(Cons _ (Cons 5  Nil))))))


(= (display-twice $s $t)(
    ($s ($s $t))
))


(: (concat ->Expression Expression Expression))

(=(concat $x $y)

   (union-atom $x $y)
)
(: (++ -> number number))
(:(-- -> number number))
(= (-- $n) (- $n 1))


(=( ++ $n) (+ $n 1))

!(++ 3)
!(-- 3)
(= (square $x)(* $x $x))
(= (duplicate $x) ($x $x))

;!(display-twice square 2)
;!(display-twice duplicate 2)

;factorial function 


(= (fact $num)(
  if(== $num 0)
      1
   (* $num (fact (- $num 1)))
))

;!(fact 5)

(= (isEven $num)(
     if(== $num 0)
          True
          (==(% $num 2) 0)

          
))
(= (isOdd $n)(
     if(== (isEven $n) True)
     False
     True
       
))

;!(isEven 4)
;!(isOdd 12)


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
;!(linear (1 3 4 5) 1)

(= (factorial $x)
   (case $x
     ((0 1)($_ (* $x (factorial (- $x 1)))))
   )
)
;!(factorial 5) ; 120



; random bit
(= (bin) 0)
(= (bin) 1)
; binary list with the same number of elements
(= (gen-bin-list ()) ())
(= (gen-bin-list (:: $x $xs))
   (:: (bin) (gen-bin-list $xs))
)
; sum of products of elements of two lists
(= (scalar-product () ()) 0)
(= (scalar-product (:: $x $xs) (:: $y $ys))
   (+ (* $x $y) (scalar-product $xs $ys))
)
; check the candidate solution
(= (test-solution $numbers $solution $target-sum)
   (if (== (scalar-product $numbers $solution)
           $target-sum)
       $solution
       (empty)
   )
)
; task
(= (task) (:: 8 (:: 3 (:: 10 (:: 17 ())))))
(test-solution (task) (gen-bin-list (task)) 20)

;!(gen-bin-list (task))


(Parent john doe Male)
(Parent mark alex Male)
(Parent merry doe Male)
(Parent merry josef Male)
(Parent meilan abubeker Male)

;!(match &self (Parent $x $y $z)($x is a parent of $y and he is $z))
(Parent Tom Bob)
(Parent Pam Bob)
(Parent Tom Liz)
(Parent Bob Ann)
(Parent Bob Pat)
(Parent fico Tom)
(Parent Pat Jim)

(Knows abebe kebede)
(= (parentOf $x)
(
      (match &self (Parent $y $x)($y is a parent of $x))
))
(= (get-parent $x)(match &self (Parent $y $x) $y))
;(=(grandParent $x)
;((match &self (Parent $p $x) (match &self (Parent $gp $p) $gp)) ))

(= (get-grandParent $x)(get-parent (get-parent $x)))
!(get-grandParent Bob)
(get)
;!(parentOf Jim)


;(Parent tom bob)
;(Parent john doe)
;(Parent cris anjela)


(Implies (Parent $x $y) (child $y $x))


(= (deduce $A)

      (match &self (Implies $B $A) (match &self $B $A))
)

;!(deduce (child bob $x))

(= (conclude $A)

(match &self (Implies $A $B)(match &self $A $A))
)


;!(conclude (Parent $x anjela))

(= (different () $y)())
(= (different $x $y)
(
    let* (
        ($h (car-atom $x))
        ($t (cdr-atom $x))
        ($rest (different $t $y))
         )
    (if(== $h $y) 
       $rest
      (cons-atom $h $rest)
)))
!(different (1 2 3 4 5) 4)

(= (replace () $x $y) ())

(= (replace $expr $index $num)
   (let* (
          ($h (car-atom $expr))
          ($t (cdr-atom $expr))
          ($rest (replace $t (- $index 1) $num))
         )
      (if (== $index 0)
          (cons-atom $num $rest)  ; Replace current element
          (cons-atom $h $rest) ; Keep current element and process rest
      )
   )
)
!(replace(1 2 3 4 5) 2 9) 
