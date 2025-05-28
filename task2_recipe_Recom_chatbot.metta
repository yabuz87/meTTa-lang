;Knowledge Representation in MeTTa :
;Represent recipes, ingredients, and relationships in MeTTa.
;Define the recipe
;Define the ingredients
;Define the relationships
;Define the relationships between ingredients and recipes

(recipe "Pasta with Tomato Sauce")
  (HasIngredient "Pasta with Tomato Sauce" "Pasta")
  (HasIngredient "Pasta with Tomato Sauce" "Tomato Sauce")
  (HasIngredient "Pasta with Tomato Sauce" "Olive Oil")
  (HasIngredient "Pasta with Tomato Sauce" "Garlic")
  (HasIngredient "Pasta with Tomato Sauce" "Basil")
  (HasIngredient "Pasta with Tomato Sauce" "Salt")
  (HasIngredient "Pasta with Tomato Sauce" "Pepper")
 (cooking_time_min "Pasta with Tomato Sauce" "Pasta with Tomato Sauce" 15)


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
(HasIngredient "Salad" "Lettuce")
(HasIngredient "Salad" "Tomato")
(HasIngredient "Salad" "Cucumber")
(HasIngredient "Salad" "Olive Oil")
(HasIngredient "Salad" "Vinegar")
(HasIngredient "Salad" "Salt")
(HasIngredient "Salad" "Pepper")
(cooking_time_min "Salad" 10)

(Recipe "Pizza")
(HasIngredient "Pizza" "Dough")
(HasIngredient "Pizza" "Tomato Sauce")
(HasIngredient "Pizza" "Cheese")
(HasIngredient "Pizza" "Pepperoni")
(cooking_time_min "Pizza" 25)




(Recipe "Soup")
(HasIngredient "Soup" "Broth")
(HasIngredient "Soup" "Vegetables")
(HasIngredient "Soup" "Noodles")
(HasIngredient "Soup" "Salt")
(HasIngredient "Soup" "Pepper")
(HasIngredient "Soup" "Herbs")
(HasIngredient "Soup" "Garlic")
(HasIngredient "Soup" "Onion")
(HasIngredient "Soup" "Carrots")
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

(= (find-recipe $ingredient1 $ingredient2 $ingredient3)
(match &self (,(HasIngredient $recipe $ingredient1)(HasIngredient $recipe $ingredient2)(HasIngredient $recipe  $ingredient3))  ( you can prepare $recipe using $ingredient1 , $ingredient2 and $ingredient3))
)


(= (print-list $x)
(if (== $x ())
  (println! "No ingredients found")
  (if (== (cdr-atom $x) ())
    (println! $x)
    (do
      (println! $x)
      (print-list (cdr-atom $x))
    )
  )
)
)
;!(find-recipe "pasta" "Ground Beef" "Tomato")
(= (print-ingredient $recipe)
 (println! (match &self (HasIngredient $recipe $y) ($recipe has ingredient $y))))


!(print-ingredient "Burger")
;!(find-recipe "Pasta" "Tomato Sauce" "Basil")
