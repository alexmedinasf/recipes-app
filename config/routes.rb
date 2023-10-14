Rails.application.routes.draw do
  devise_for :users
  root 'public_recipes#index'

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :update, :show, :destroy] do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end  

  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'
  get '/shopping_list', to: 'shopping_lists#index', as: 'general_shopping_list'

end