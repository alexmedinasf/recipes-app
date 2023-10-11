Rails.application.routes.draw do
  devise_for :users
  root 'public_recipe#index'
  # root "users#index"
  resources :recipe_foods
    resources :recipes do
      resources :foods
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end