Rails.application.routes.draw do
  resources :groups
  root 'users#new'
  resources :tasks
  resources :users
  resources :label_masters, only: [:index,:create,:update,:destroy]
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users
  end

end
