Rails.application.routes.draw do
  resources :posts, only: [:new, :index, :create]

  root                  'posts#index'

  get   '/login',   to: 'sessions#new'
  post  '/login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
