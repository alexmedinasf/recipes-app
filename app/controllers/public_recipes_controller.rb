class PublicRecipesController < ApplicationController
  def index
    @user = User.all
  end
end
