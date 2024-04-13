Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :warehouses
  resources :suppliers
  resources :product_models
end
