Rails.application.routes.draw do
  resources :orders
  resources :dishes
  resources :types
  resources :wallets
  resources :openings
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
