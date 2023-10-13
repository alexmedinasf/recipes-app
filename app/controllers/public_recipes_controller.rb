class PublicRecipesController < ApplicationController
  def index
    @user = User.all
    @recipes = Recipe.all
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
    @recipe_foods = @recipes.recipe_foods
  end
end
