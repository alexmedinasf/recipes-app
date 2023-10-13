class RecipesController < ApplicationController
  before_action :authenticate_user!
  # , :set_recipe, only: %i[show edit update destroy]
  # load_and_authorize_resource

  # GET /recipes or /recipes.json
  def index
    @user = current_user
    @recipes = @user.recipes
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @user = current_user
    @recipe = @user.recipes.find(params[:id])
    @foods = Food.all
    @recipe_foods = RecipeFood.includes(:food).where(recipe_id: params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    new_value_public = @recipe.public ? false : true
    @recipe.update(public: new_value_public)
    redirect_to recipe_path(@recipe)
  end

  def new
    @user = current_user
    @recipe = @user.recipes.new
  end

  def edit; end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      flash[:success] = 'The recipe food was created.'
      redirect_to recipes_path
    else
      flash[:error] = 'Error occured.'
    end
  end

def destroy
  @user = current_user
  @recipe = @user.recipes.find_by(id: params[:id])
  if @recipe
      @recipe.destroy
      redirect_to recipes_path
    else
      flash[:error] = 'Error'
    end
  end

  private

 
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
