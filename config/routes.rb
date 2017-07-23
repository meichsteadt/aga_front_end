Rails.application.routes.draw do
  resources :users
  resources :emails
  resources :products
  resources :logins
  get "/login", to: "logins#new"
  root 'splash#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
