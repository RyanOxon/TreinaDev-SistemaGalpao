Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :warehouses
  resources :suppliers
  resources :product_models
  resources :orders
end
