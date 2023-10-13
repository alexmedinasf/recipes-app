Rails.application.routes.draw do
  devise_for :users
  root 'public_recipe#index'

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end  

  get '/public_recipes', to: 'recipe_foods#index', as: 'public_recipes'
  get '/shopping_list', to: 'shopping_lists#index', as: 'shopping_list'  

end