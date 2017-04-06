Rails.application.routes.draw do
  resources :users
  resources :notes
  resources :investors

  root "investors#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
