Rails.application.routes.draw do
  root "static_pages#index"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "password_resets/new"
  get "password_resets/edit"
  get "/checkout", to: "order_details#checkout"

  namespace :admin do
    get "/", to: "dashboards#index"
  end
  resources :users
  resources :account_activations, only: :edit
  resources :password_resets, except: %i(index show)
  resources :products
  resources :categories

  get "/admin", to: "admins#index"
end
