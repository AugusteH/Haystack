Rails.application.routes.draw do
  resources :clients
  devise_for :users
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # match "/*path" => redirect("/?goto=%{path}")

  class XHRConstraint
  # change ::Rails.env != 'test' for different environemnts below i.e production, development etc.. 
    def matches?(request)
      !request.xhr? && !(request.url =~ /\.json$/ && ::Rails.env != 'test')
    end
  end

   match "/*path" => redirect("/%{path}"), :via => [:get, :post, :put, :delete], :constraints => XHRConstraint.new

  root 'products#index'

end
