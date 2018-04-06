Rails.application.routes.draw do

  root "dashboard#home"

  devise_for :users

  namespace :admin do
    resources :users
  end

  resources :questions

end
