Rails.application.routes.draw do

  root "sessions#home"  

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/auth/google_oauth2/callback' => 'sessions#googleauth'

  delete '/logout' => 'sessions#destroy'
  
  resources :appointments
  resources :roles
  resources :comments
  
  resources :users do
    resources :cases, only: [:new, :create, :index]
    resources :appointments, only: [:new, :create, :index]
  end

  resources :cases do 
    resources :appointments, only: [:new, :create, :index]
  end

  resources :appointments do 
    resources :comments, only: [:new, :create, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# http://localhost:3000/


# rails generate model Product name:string description:text