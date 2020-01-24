Rails.application.routes.draw do
  root to: "users#welcome"
  resources :study_groups
  resources :users
  resources :comments
  get '/login', to:'sessions#new', as:'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as:'logout'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'  
  post '/study_groups/filter', to: 'study_groups#filter'
  #post '/participate', to: 'study_groups#add_to_study_group', as: '/participate'
  get '/study_groups/:id/join', to: 'study_groups#join', as:'join_study_group'
  get '/study_groups/:id/leave', to: 'study_groups#leave', as:'leave_study_group'
  get '/users/:id/mygroups', to: 'users#mygroups', as: 'mygroups'
  post '/study_groups/:id/study_group_comments', to: 'comments#create', as: 'study_group_comments'
  get '/comments/:id', to: 'comments#show'
  # delete '/comments/:id/delete', to: 'comments#destroy'
  get '/comments/:id/delete', to: 'comments#destroy', as: 'delete_comment'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
