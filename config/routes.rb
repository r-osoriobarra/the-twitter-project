Rails.application.routes.draw do
  get 'likes/new'
  get 'likes/create'
  get 'likes/destroy'
  
  devise_for :users
  resources :users do
    resources :tweets, except: [:index]
  end
  root 'tweets#index'
end
