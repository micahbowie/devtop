Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  #users routes
  resources :sessions, only: [:create]
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'

  #session routes
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  get '/error', to: 'sessions#error'

  #notes routes
  resources :notes

  #flashcard routes
  resources :flashcards
  post '/savecard', to: 'flashcards#create'

  #dashboard routes
  get '/devtop', to: 'dashboards#index'
  post '/gosearch', to: 'dashboards#gosearch'
  #thatlab routes
  resources :thatlabs, only: [:index]
  get '/thatlab', to: 'thatlabs#find'

  #question routes
  resources :questions
  # get '/questions', to: 'thatlabs#all_questions'
  # get '/questions/new', to: 'thatlabs#new_question'
  # get '/questions/:id', to: 'thatlabs#question_show', as: 'question'
  post 'savequestion', to: 'questions#create'

  #answer routes
  post 'saveanswer/:id', to: 'thatlabs#create_answer'

end
