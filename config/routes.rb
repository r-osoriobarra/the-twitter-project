Rails.application.routes.draw do
  get 'likes/new'
  get 'likes/create'
  get 'likes/destroy'
  get 'tweets/index'
  get 'tweets/show'
  get 'tweets/new'
  get 'tweets/create'
  get 'tweets/edit'
  get 'tweets/update'
  get 'tweets/destroy'
  devise_for :users
  resources :users do
    resources :tweets
  end
  root 'home#index'
end
