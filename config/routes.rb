Rails.application.routes.draw do
  resources :notes
  resources :investors
  resources :welcomes
  resources :users

  root "investors#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
