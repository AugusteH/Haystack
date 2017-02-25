Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :clients
  resources :products

  root 'products#index'

end
