Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  resources :residences, except: [:new] do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
end
