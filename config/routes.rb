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
  get 'auth/github', :as => 'github_auth'
  match 'auth/:provider/callback', to: 'sessions#github_login', via: [:get, :post]

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
  post 'savequestion', to: 'questions#create'

  #answer routes
  post 'saveanswer/:id', to: 'thatlabs#create_answer'

  # idea routes
  scope :projects, module: 'projects', as: 'project' do
    resources :ideas, only: [:new, :create, :index, :show]
  end
  
  # project routes
  resources :projects, only: [:show, :index]



end
