Rails.application.routes.draw do

  resources :profiles
  resources :assignments
  root "dashboard#home"

  devise_for :users

  namespace :admin do
    resources :users
  end

  resources :questions

end
