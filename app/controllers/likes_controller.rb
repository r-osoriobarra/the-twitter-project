class LikesController < ApplicationController
    before_action :authenticate_user!
    
    def create
        tweet = Tweet.find(params[:id])
        like = Like.create(user_id: current_user.id, tweet_id: tweet.id)
        
        if like.save
            redirect_to root_path, notice: "se creó un like!"
        end
    end

    def destroy
        tweet = Tweet.find(params[:id])
        like = Like.find_by(user_id: current_user.id)
        like.destroy
        redirect_to root_path, notice: 'se destruyó un like'
    end    
    
end