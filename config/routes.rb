Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :session, only: [:new, :create]
  resources :attractions, only: [:index, :new, :create, :show]
  get '/signin', to: 'session#new', as: 'login'
  delete '/', to: 'session#destroy', as: 'logout'
  post '/attraction/:id', to: 'rides#create', as: 'rides'
end
