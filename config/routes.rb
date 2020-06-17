Rails.application.routes.draw do
  resources :tasks
  root to: "tasks#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
