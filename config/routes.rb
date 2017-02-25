Rails.application.routes.draw do

  resources :clients
  resources :products

  root 'products#index'

end
