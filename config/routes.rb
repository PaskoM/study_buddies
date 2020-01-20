Rails.application.routes.draw do
  root to: "users#welcome"
  resources :study_groups
  resources :users
  get '/login', to:'sessions#new', as:'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as:'logout'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
