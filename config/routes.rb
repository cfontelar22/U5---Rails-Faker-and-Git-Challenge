Rails.application.routes.draw do
  resources :products, only: [:index, :show]
  
  # Set root route to products#index
  root 'products#index'
end
