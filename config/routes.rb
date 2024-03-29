Rails.application.routes.draw do

  #api routes
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      post 'create_tweet', to: 'tweets#create_api_tweet', as: 'create_tweet'
      get 'news', to: 'tweets#news', as: 'tweets'
      get '/:date1/:date2', to: 'tweets#by_dates', as: 'by_dates'
    end
  end
  
  #activeadmin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  #devise
  devise_for :user
  
  #nested routes users adn tweets
  resources :users do
    resources :tweets, except: [:index]
  end

  #root
  root 'tweets#index'
  get 'home/suspended', to: 'home#index', as: 'suspended'

  
  #create routes
  post '/follows/:id', to: 'follows#create', as:'create_follow' #requiero del id del usuario
  post '/likes/:id', to: 'likes#create', as:'create_like' #requiero de id del tweet
  post '/tweets/:id', to: 'tweets#retweet', as:'create_retweet' #requiero del id del tweet
  
  #destroy routes
  delete '/likes/:id', to:'likes#destroy', as:'destroy_like' #quiero el id del tweet
  delete '/follows/:id', to:'follows#destroy', as:'destroy_follow' #quiero el id del user
end
