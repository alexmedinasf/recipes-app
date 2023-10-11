class PublicRecipeController < ApplicationController
    def index
      @user = User.all
    end
  end