Rails.application.routes.draw do
  
  devise_for :user

  post '/likes/:id', to: 'likes#create', as:'create_like'
  post '/tweets/:id', to: 'tweets#retweet', as:'create_retweet'
  delete '/likes/:id', to:'likes#destroy', as:'destroy_like'

  resources :users do
    resources :tweets, except: [:index]
  end

  root 'tweets#index'
end
