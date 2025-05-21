(recipe "Pasta with Tomato Sauce")
  (HasIngredient "Pasta with Tomato Sauce" "Pasta")
  (HasIngredient "Pasta with Tomato Sauce" "Tomato Sauce")
  (HasIngredient "Pasta with Tomato Sauce" "Olive Oil")
  (HasIngredient "Pasta with Tomato Sauce" "Garlic")
  (HasIngredient "Pasta with Tomato Sauce" "Basil")
  (HasIngredient "Pasta with Tomato Sauce" "Salt")
  (HasIngredient "Pasta with Tomato Sauce" "Pepper")
 (cooking_time_min "Pasta with Tomato Sauce" 15)


(recipe "burger")
(HasIngredient "Burger" "Ground Beef")
(HasIngredient "Burger" "Lettuce")
(HasIngredient "Burger" "Tomato")
(HasIngredient "Burger" "Onion")
(HasIngredient "Burger" "Cheese")
(HasIngredient "Burger" "Pickles")
(HasIngredient "Burger" "Ketchup")
(HasIngredient "Burger" "Mustard")
(cooking_time_min "Burger" 20)

(Recipe "Salad")
(HasIngredient "Salad" "Tomato")
(HasIngredient "Salad" "Olive Oil")
(HasIngredient "Salad" "Vinegar")
(HasIngredient "Salad" "Salt")
(cooking_time_min "Salad" 10)

(Recipe "Pizza")
(HasIngredient "Pizza" "Dough")
(HasIngredient "Pizza" "Tomato Sauce")
(HasIngredient "Pizza" "Cheese")
(cooking_time_min "Pizza" 25)




(Recipe "Soup")
(HasIngredient "Soup" "Broth")
(HasIngredient "Soup" "Vegetables")
(HasIngredient "Soup" "Noodles")
(HasIngredient "Soup" "Onion")
(cooking_time_min "Soup" 30)

(Recipe "Cake")
(HasIngredient "Cake" "Flour")
(HasIngredient "Cake" "Sugar")
(HasIngredient "Cake" "Eggs")
(HasIngredient "Cake" "Butter") 
(HasIngredient "Cake" "Baking Powder")
(HasIngredient "Cake" "Vanilla Extract")
(HasIngredient "Cake" "Milk")
(cooking_time_min "Cake" 45)


(recipe "pancake")
(HasIngredient "Pancake" "Flour")
(HasIngredient "Pancake" "Milk")
(HasIngredient "Pancake" "Eggs")
(HasIngredient "Pancake" "Sugar")
(HasIngredient "Pancake" "Baking Powder")
(HasIngredient "Pancake" "Salt")
(HasIngredient "Pancake" "Butter")
(cooking_time_min "Pancake" 20)

(recipe "Omelette")
(HasIngredient "Omelette" "Eggs")
(HasIngredient "Omelette" "Milk")
(HasIngredient "Omelette" "Cheese")
(HasIngredient "Omelette" "Bell Pepper")
(HasIngredient "Omelette" "Onion")
(HasIngredient "Omelette" "Salt")
(HasIngredient "Omelette" "Pepper")
(cooking_time_min "Omelette" 10)

;write a function to check some recipes with their ingredients

;(= (find-recipe $ingredient1 $ingredient2 $ingredient3)
;(match &self (,(HasIngredient $recipe $ingredient1)(HasIngredient $recipe $ingredient2)(HasIngredient $recipe  $ingredient3))  ( you can prepare $recipe using $ingredient1 , $ingredient2 and $ingredient3))
;)



(= (find-recipe $expr)
  (
    if(== (size-atom $expr) 1)
        (let* ($ingredient1  (index-atom $expr 0))
        (println!  (match &self (,(HasIngredient $recipe $ingredient2)(cooking_time_min $recipe $time)) ($recipe $ingredient2 $time))))
        (if (== (size-atom $expr) 2)
        (match-two (index-atom $expr 0) (index-atom $expr 1))
         (if (== (size-atom $expr) 3)
           (let* (($ingredient1 (index-atom $expr 0))
                  ($ingredient2 (index-atom $expr 1))
                  ($ingredient3 (index-atom $expr 2)))
                  
                  (
                    (match-two $ingredient1 $ingredient2)
                    (match-three $ingredient1 $ingredient2 $ingredient3)
                  )
                  )
                  ()
           
           ))
    )
    
    
    
  )


;!(print-ingredient "Burger")
;!(find-recipe "Pasta" "Tomato Sauce" "Basil")


;non-determinstically find any recide with one or two ingredient. by matching the recipe with the ingredient
(= (match-two $ingredient1 $ingredient2)
 ( match &self (,(HasIngredient $recipe $ingredient1)(cooking_time_min $recipe $time)) ( $recipe $ingredient1 $time))
)
(= (match-two $ingredient1 $ingredient2)
 (match &self (,(HasIngredient $recipe $ingredient2)(cooking_time_min $recipe $time)) ($recipe $ingredient2 $time))
 )
 (= (match-two $ingredient1 $ingredient2)
    ( match &self (,(HasIngredient $recipe $ingredient1)(HasIngredient $recipe $ingredient2)(cooking_time_min $recipe $time)) ($recipe $ingredient1 $ingredient2 $time))
 )

;this one is to match three ingredients





(= (match-three $ingredient1 $ingredient2 $ingredient3)
   (match &self (, (HasIngredient $recipe $ingredient1) (HasIngredient $recipe $ingredient2) (HasIngredient $recipe  $ingredient3)(cooking_time_min $recipe $time)) ($recipe $ingredient1  $ingredient2  $ingredient3 $time))
   
  )
(= (match-three $ingredient1 $ingredient2 $ingredient3)
  (match &self (, (HasIngredient $recipe $ingredient1) (HasIngredient $recipe $ingredient2)(cooking_time_min $recipe $time)) ($recipe $ingredient1 $ingredient2 $time))
      
  )

 
  (= (match-three $ingredient1 $ingredient2 $ingredient3)
   (match &self (, (HasIngredient $recipe $ingredient2)(HasIngredient $recipe  $ingredient3)(cooking_time_min $recipe $time)) ($recipe $ingredient2 $ingredient3 $time))
  
  )

(= (match-three $ingredient1 $ingredient2 $ingredient3)
   (match &self (, (HasIngredient $recipe $ingredient1)(HasIngredient $recipe  $ingredient3)(cooking_time_min $recipe $time)) ($recipe $ingredient1  $ingredient3 $time))
    
  )


(= (match-three $ingredient1 $ingredient2 $ingredient3)
    ( (match-two $ingredient1 $ingredient2)
       (match-two $ingredient2 $ingredient3)
       )
)




;!(match-three "Pasta" "Tomato Sauce" "Basil")
;!(match-three "Pasta" "Tomato Sauce" "carrot")
;!(match-two "Eggs" "Salt")
;!(find-recipe ("Pasta" "Tomato Sauce" "Basil" "Olive Oil"))
!(find-recipe ("Pasta" "Dough" "Broth"))
;!(match-two  "Pepper" "Flour")
;!(find-recipe ("Pasta"))
