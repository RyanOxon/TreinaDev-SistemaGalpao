Rails.application.routes.draw do
  root to: 'home#index'
  resources :warehouses
  resources :suppliers
  resources :product_models
end
