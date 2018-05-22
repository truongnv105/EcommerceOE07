Rails.application.routes.draw do

  root "static_pages#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/admin", to: "admin#index"

  resources :users
  resources :account_activations, only: :edit
end
