Rails.application.routes.draw do

  resources :wizard

  root 'home#index'

end
