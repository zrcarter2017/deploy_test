Rails.application.routes.draw do
  resources :notes
  resources :investors
  resources :users

  root "investors#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
