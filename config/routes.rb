Rails.application.routes.draw do
  root to: "users#welcome"
  resources :study_groups
  resources :users
  get '/login', to:'sessions#new', as:'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as:'logout'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'  
  post '/study_groups/filter', to: 'study_groups#filter'
  #post '/participate', to: 'study_groups#add_to_study_group', as: '/participate'
  get '/study_groups/:id/join', to: 'study_groups#join', as:'join_study_group'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
