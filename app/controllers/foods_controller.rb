class FoodsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
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
      redirect_to foods_path
    else
      flash[:error] = 'Error: Food could not be added'
      render 'new'
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
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
