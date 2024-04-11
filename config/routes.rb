Rails.application.routes.draw do
  root to: 'home#index'
  resources :warehouses
  resources :suppliers
end
