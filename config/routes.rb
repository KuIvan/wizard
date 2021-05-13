Rails.application.routes.draw do
  devise_for :users
  resources :wizard
  root 'home#index'
end
