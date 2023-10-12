Rails.application.routes.draw do
  devise_for :users
  root 'public_recipe#index'

  resources :recipes, only: [:index, :new, :create, :show, :destroy]
  resources :foods, only: [:index, :new, :create, :destroy]

  get '/public_recipes', to: 'recipe_foods#index', as: 'public_recipes'
end