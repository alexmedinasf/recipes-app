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
    @recipe_food = RecipeFood.find(params[:id])
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)

    if @recipe_food.save
      flash[:success] = 'Recipe ingredient was successfully created'
      redirect_to request.referrer #HAY QUE REVISAR ESTA RUTA AL ASOCIAR LAS VISTAS
    else
      flash[:error] = 'Error: Food could not be added'
      redirect_to request.referrer
    end
  end

  # PATCH/PUT /recipe_foods/1 or /recipe_foods/1.json
  def update
    recipe_food = @recipe_food.find_by(id: params[:id])
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to @recipe_food.recipe
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
    @foods_to_select = @foods.where.not(id: @recipe_food.pluck(:food_id))
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
