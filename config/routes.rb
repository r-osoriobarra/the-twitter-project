Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :user
  
  resources :users do
    resources :tweets, except: [:index]
  end
  resources :hashtags
  root 'tweets#index'
  
  #create routes
  post '/follows/:id', to: 'follows#create', as:'create_follow' #requiero del id del usuario
  post '/likes/:id', to: 'likes#create', as:'create_like' #requiero de id del tweet
  post '/tweets/:id', to: 'tweets#retweet', as:'create_retweet' #requiero del id del tweet
  
  #destroy routes
  delete '/likes/:id', to:'likes#destroy', as:'destroy_like' #quiero el id del tweet
  delete '/follows/:id', to:'follows#destroy', as:'destroy_follow' #quiero el id del user
end
