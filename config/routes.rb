Rails.application.routes.draw do
  devise_for :users
  resources :wizard, only: [:show, :update]
  resources :work_experiences, only: [:destroy]
  root 'home#index'
end
