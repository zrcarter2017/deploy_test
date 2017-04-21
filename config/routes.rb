Rails.application.routes.draw do
  resources :distributions
  resources :notetypes
  resources :investors
  resources :notes
  resources :criterias

  root "investors#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # This route sends requests to our naked url to the *cool* action in the *gif* controller.
  root to: 'gif#cool'


  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
