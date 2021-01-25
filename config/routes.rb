Rails.application.routes.draw do
  root "home#index"

  # shop
  get "/shop" => "shop#index", as: :shop

  # sessions
  get "/signin" => "sessions#new", as: :new_session
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

  #admin panel
  get "/manage/users" => "manage#users"
  get "/manage/menus" => "menus#index"
  get "/manage/reports" => "manage#reports"

  put "/menus/active" => "menus#active"

  put "/cart/add" => "cart#add", as: :add_to_cart

  post "/users/add" => "users#add", as: :add_user

  #reports
  get "/reports" => "reports#index", as: :reports
  get "/reports/user/:id" => "reports#user", as: :user_report

  resources :cart
  resources :users
  resources :menuitems
  resources :menus
  resources :orders
end
