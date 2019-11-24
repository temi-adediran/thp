Rails.application.routes.draw do
  namespace :admin do
    resources :chapters
    resources :users
    resources :zones
    resources :roles

    root to: "zones#index"
  end

  namespace :zonal_admin do
    resources :users
    resources :chapters
    resources :zones

    root to: "chapters#index"
  end

  namespace :chapter_admin do
    resources :chapters
    resources :users
    root to: "users#index"
  end


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

  get "dashboard", to: "dashboard#index", as: "dashboard"
  get "profile/:id", to: "users#profile", as: "profile"
  get "edit_profile/:id", to: "users#edit_profile", as: "edit_profile"
  get "account_settings/:id", to: "users#account_settings", as: "account_settings"
  patch "update_account/:id", to: "users#update_account", as: "update_account"
  patch "update_profile/:id", to: "users#update_profile", as: "update_profile"
end
