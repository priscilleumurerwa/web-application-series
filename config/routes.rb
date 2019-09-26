Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :users, only: [:new, :create, :show]
  resources :tasks
  root to:'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
