Rails.application.routes.draw do
  resources :posts, only: [:new, :index, :create]
  resources :users

  root       'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/user', to: 'users#show'
end
