class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe_food, only: %i[show edit update destroy]

  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipes = Recipe.includes(:recipe_foods, :user)
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show; end

  # GET /recipe_foods/new
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
    @foods_to_select = @foods.where.not(id: @recipe.recipe_foods.pluck(:food_id))
    @recipe_food = RecipeFood.new
  end

  # GET /recipe_foods/1/edit
  def edit
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)

    if @recipe_food.save
      flash[:success] = 'Recipe ingredient was successfully created'
    else
      flash[:error] = 'Error: Food could not be added'
    end
    redirect_to request.referrer
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])

    if @recipe_food.update(update_recipe_food)
      flash[:success] = 'food recipe updated'
    else
      flash[:error] = 'Error'
    end
    redirect_to recipe_path(@recipe_food.recipe.id)
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to @recipe_food.recipe
  end

  private

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
    @foods = @recipe_food.food
  end

  def update_recipe_food
    params.require(:recipe_food).permit(:quantity)
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
