Rails.application.routes.draw do
  resources :tasks_labels
  resources :labels
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :users, only: [:new, :create, :show]
  resources :tasks
  root to:'sessions#new'
  
  namespace :admin do
    resources :users
    resources:application
 root to:'users#index'
  end
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
