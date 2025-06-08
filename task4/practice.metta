!(bind! &kb (new-space))
!(add-reduct &kb (: Fact1 (has_sides 5 polygon)))
!(add-reduct &kb (: Fact2 (has_sides 4 rectangle)))
!(add-reduct &kb (: Fact3 (has_sides 4 rhombus)))
!(add-reduct &kb (: Fact4 (is polygon triangle)))
!(add-reduct &kb (: Fact6 (has_sides 3 polygon)))
;!(add-reduct &kb (: Fact5 (has_sides 3 triangle)))
; !add-atom  &kb (: Fact6 (is polygon ))
!(add-reduct &kb (: Fact6 (has_sides 4 quadrilateral)))


;!(match &myspace  $x $x)

(= (fromNumber $n) (if (<= $n 0) Z (S (fromNumber (- $n 1)))))



(add-reduct &kb (: triangle-rule 
                          (->  (has_sides 3 polygon)
                          
                             (-> (is polygon $x) (has_sides 3 $x))
                                    )))
                            





;; Base case
(= (syn $kb $_ (: $prf $ccln)) (match $kb (: $prf $ccln) (: $prf $ccln)))

;; Recursive step
(= (syn $kb (S $k) (: ($prfabs $prfarg) $ccln))
   (let* (
       ((: $prfabs (-> $prms $ccln)) (syn $kb $k (: $prfabs (-> $prms $ccln))))
          ((: $prfarg $prms) (syn $kb $k (: $prfarg $prms))))
     (: ($prfabs $prfarg) $ccln)))

(: bc (-> $a                           ; Knowledge base space
          Nat                          ; Maximum depth
          $b                           ; Query
          $b))                         ; Result

;; Base case
(= (bc $kb $_ (: $prf $ccln)) (match $kb (: $prf $ccln) (: $prf $ccln)))

;; Recursive step
(= (bc $kb (S $k) (: ($prfabs $prfarg) $ccln))
   (let* (((: $prfabs (-> $prms $ccln)) (bc $kb $k (: $prfabs (-> $prms $ccln))))
          ((: $prfarg $prms) (bc $kb $k (: $prfarg $prms))))
     (: ($prfabs $prfarg) $ccln)))




!(syn &kb (fromNumber 2) (: $prf ((is polygon triangle))))