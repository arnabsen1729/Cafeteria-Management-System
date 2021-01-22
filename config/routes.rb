Rails.application.routes.draw do
  root "home#index"
  get "/dashboard" => "dashboard#index", as: :dashboard
  get "/signin" => "sessions#new", as: :new_session
  post "/signin" => "sessions#create", as: :sessions
  resources :users
end
