Rails.application.routes.draw do
  resources :users
  resources :emails
  resources :products
  get "/:category_id/:page", to: "products#index"
  resources :logins
  get "/login", to: "logins#new"
  get "users/:id/edit/:category", to: "users#edit"
  root 'splash#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
