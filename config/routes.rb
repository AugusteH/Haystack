Rails.application.routes.draw do
  get 'users/create'

  get 'users/update'

  get 'users/destroy'

  resources :clients
  devise_for :users
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  root 'products#index'

end
