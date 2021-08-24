class LikesController < ApplicationController
    before_action :authenticate_user!
    
    def create
        tweet = Tweet.find(params[:id])
        like = Like.create(user_id: current_user.id, tweet_id: tweet.id)
        
        if like.save
            redirect_to root_path, notice: "You just added a like!"
        end
    end

    def destroy
        tweet = Tweet.find(params[:id])
        like = tweet.likes.find_by(user_id: current_user.id)
        like.destroy
        redirect_to root_path, notice: "You just added a dislike!"
    end    
    
end