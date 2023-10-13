class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:recipe_foods, :user, :foods).where(public: true)
    @amount = 0
  end
end
