Rails.application.routes.draw do
  root "home#index"
  resources :users, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  get "forgot_password", to: "password_resets#new", as: "forgot_password"
  get "reset_password", to: "password_resets#edit", as:"reset_password"
  post "change_password", to: "users#change_password"
end
