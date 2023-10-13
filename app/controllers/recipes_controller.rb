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
    recipe_foods = RecipeFood.includes(:food).where(recipe_id: params[:id])
  end

  # GET /recipes/new
  def new
    @user = current_user
    @recipe = @user.recipes.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      flash[:success] = 'The recipe food was created.'
      redirect_to recipes_path
    else
        flash[:error] = 'Error occured.'
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    flash[:success] = 'The recipe was upataded.'
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to user_recipes_path(params[:user_id]), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
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

  # callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
