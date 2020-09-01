Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users, only: [:show]
  resources :carts
  
  resources :items
  root to: "items#index"
end
