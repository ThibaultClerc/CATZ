Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users, only: [:show]
  resources :carts
  resources :orders
  resources :items
  resources :join_table_item_carts, only: [:create, :destroy]
  root to: "items#index"

  namespace :admin do
    resources :users
    resources :items
    resources :orders, only: [:index, :destroy]
  end

end
