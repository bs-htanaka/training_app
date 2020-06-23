Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  
  resources :tasks
  root to: "tasks#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
