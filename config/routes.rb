Rails.application.routes.draw do
  resources :addtasks
  root 'tasks#index'
  resources :tasks
end
