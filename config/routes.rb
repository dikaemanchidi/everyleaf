Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :addtasks
  root 'tasks#index'
  resources :tasks
end
