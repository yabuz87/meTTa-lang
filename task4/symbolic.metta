;; Define cast functions between Nat and Number

(= (fromNumber $n) (if (<= $n 0) Z (S (fromNumber (- $n 1)))))

;; Knowledge base
!(bind! &kb (new-space))
!(add-atom &kb (: FACT1 (Evaluation croaks Fritz)))
!(add-atom &kb (: FACT2 (Evaluation chirps Tweety)))
!(add-atom &kb (: FACT3 (Inheritance Tweety yellow)))
!(add-atom &kb (: FACT4 (Evaluation eats_flies Tweety)))
!(add-atom &kb (: FACT5 (Evaluation eats_flies Fritz)))



;  rule1
!(add-reduct &kb (: frog-rule 
                  (-> (Evaluation croaks $x)  
                      (-> (Evaluation eats_flies $x) 
                             (Inheritance $x frog)) 
)))
;rule2
!(add-reduct &kb (: green-rule 
                    (-> (Inheritance $x frog) 
                            (Inheritance $x green))))


                     

;; Base case
(= (syn $kb $_ (: $prf $ccln)) (match $kb (: $prf $ccln) (: $prf $ccln)))

;; Recursive step
(= (syn $kb (S $k) (: ($prfabs $prfarg) $ccln))
   (let* (
       ((: $prfabs (-> $prms $ccln)) (syn $kb $k (: $prfabs (-> $prms $ccln))))
          ((: $prfarg $prms) (syn $kb $k (: $prfarg $prms))))
     (: ($prfabs $prfarg) $ccln)))

;; Base case
(= (bc $kb $_ (: $prf $ccln)) (match $kb (: $prf $ccln) (: $prf $ccln)))

;; Recursive step
(= (bc $kb (S $k) (: ($prfabs $prfarg) $ccln))
   (let* (((: $prfabs (-> $prms $ccln)) (bc $kb $k (: $prfabs (-> $prms $ccln))))
          ((: $prfarg $prms) (bc $kb $k (: $prfarg $prms))))
     (: ($prfabs $prfarg) $ccln)))

;; Forward DTL Curried
(: fcc (-> $a                            ; Knowledge base space
           Nat                           ; Maximum depth
           $b                            ; Source
           $b))                          ; Conclusion

;; Base case
(= (fcc $kb $_ (: $prf $prms)) (: $prf $prms))

;; Recursive step
(= (fcc $kb (S $k) (: $prfarg $prms))
   (let (: $prfabs (-> $prms $ccln)) (bc $kb $k (: $prfabs (-> $prms $ccln)))
     (fcc $kb $k (: ($prfabs $prfarg) $ccln))))
(= (fcc $kb (S $k) (: $prfabs (-> $prms $ccln)))
    (let (: $prfarg $prms) (bc $kb $k (: $prfarg $prms))
     (fcc $kb $k (: ($prfabs $prfarg) $ccln))))


;!(syn &kb (fromNumber 3) (: $prf (Inheritance $who_is_green green)))
!(fcc &kb (fromNumber 4) (: FACT1 (Evaluation croaks Fritz)))


[(: ((frog-rule FACT1) FACT5) (Inheritance Fritz frog))]

[
(: (frog-rule FACT1) (-> (Evaluation eats_flies Fritz) (Inheritance Fritz frog))), 
(: (green-rule ((frog-rule FACT1) FACT5)) (Inheritance Fritz green)), 
(: ((frog-rule FACT1) FACT5) (Inheritance Fritz frog)), 
(: FACT1 (Evaluation croaks Fritz))]