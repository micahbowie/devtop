Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #users routes
  resources :sessions, only: [:create]
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'

  #session routes
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'

  #notes routes
  resources :notes
  root "note#index "

  #flashcard routes
  resources :flashcards
  post '/savecard', to: 'flashcards#create'

end
