class FoodsController < ApplicationController
  def index
    return unless params[:user_id]

    @user = User.find(params[:user_id])
    @foods = @user.foods
  end

  def new
    @user = current_user
    @food = @user.foods.new
  end

  def create
    new_food = current_user.foods.new(food_params)
    if new_food.save
      flash[:success] = 'New food added'
      # TBD redirect path to food menu
    else
      flash[:error] = 'Error: Food could not be added'
      # TBD redirect path to food menu
    end
  end

  def update; end

  def show
    @user = User.find(params[:user_id])
    @foods = @user.foods
  end

  def destroy; end

  private

  def food_params
    params.require(:food).permit(:measurement_unit, :price)
  end
end
