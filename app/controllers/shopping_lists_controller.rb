class ShoppingListsController < ApplicationController
  def index
    @recipes = current_user.recipes.includes(:recipe_foods)
    @value = total_value(@recipes)
    @foods = current_user.foods
  end

  def total_value(recipes)
    @food_data = {}
    @total = 0
    recipes.each do |recipe|      
      recipe.recipe_foods.each do |rf|
        if @food_data[rf.food.id].nil?
          @food_data[rf.food.id] = rf.quantity
        else
          @food_data[rf.food.id] += rf.quantity
        end
        subtotal = ((rf.food.quantity - rf.quantity) * rf.food.price)
        @total += subtotal      
      end
    end
    [@total, @food_data]      
  end
end
