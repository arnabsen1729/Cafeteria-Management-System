Rails.application.routes.draw do
  root "home#index"

  # dashboard
  get "/dashboard" => "dashboard#index", as: :dashboard

  # sessions
  get "/signin" => "sessions#new", as: :new_session
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

  #admin panel
  get "/manage/users" => "manage#users"
  get "/manage/menus" => "manage#menus"
  get "/manage/reports" => "manage#reports"

  post "/users/add" => "users#add", as: :add_user
  resources :users
  resources :menuitems
  resources :menus
end
