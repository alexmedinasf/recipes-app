class RecipeFood < ApplicationRecord
    # associations
    belongs_to :recipe, class_name: 'Recipe', foreign_key: 'recipe_id'
    belongs_to :food, class_name: 'Food', foreign_key: 'food_id'
  
    # validations
    validates :recipe_id, presence: true
    validates :food_id, presence: true
    validates :recipe_id, uniqueness: { scope: :food_id, message: "This food is already added to this recipe" }
  
    # validate quantity
    validates :quantity, presence: true
  end