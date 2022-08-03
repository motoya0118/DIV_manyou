Rails.application.routes.draw do
  resources :groups
  root 'users#new'
  resources :tasks
  resources :users
  resources :label_masters, only: [:index,:create,:update,:destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :table_groupusers, only: [:index, :create, :destroy]
  namespace :admin do
    resources :users
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
