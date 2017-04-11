Rails.application.routes.draw do
  resources :investors
  resources :users
  resources :notes

  root "investors#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
