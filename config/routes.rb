Rails.application.routes.draw do
  get 'likes/new'
  get 'likes/create'
  get 'likes/destroy'
  
  devise_for :users
  resources :users do
    resources :tweets
  end
  root 'home#index'
end
