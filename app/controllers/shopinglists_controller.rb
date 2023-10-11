class ShopinglistsController < ApplicationController
  def index
    @recipefoods = RecipeFood.includes(:food).where(recipe_id: params[:recipe_id])
  end
end
