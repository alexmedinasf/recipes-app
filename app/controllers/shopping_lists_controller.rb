class ShoppingListsController < ApplicationController
  def index
    current_user

    @recipefoods = RecipeFood.includes(:food).where(recipe_id: params[:recipe_id])
  end
end
