class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.order(created_at: :desc).page(params[:page])
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
    @user = current_user
  end

  def retweet
    original_tweet = Tweet.find(params[:id])
    @tweet = Tweet.create(
      content: original_tweet.content,
      user_id: original_tweet.user_id,
      tweet_id: original_tweet.id
    )
    redirect_to root_path, notice: "se creó un retweet!"
  end

  def create
    @tweet = Tweet.create(tweet_params)
    @user = current_user

    @tweet.user = current_user

      respond_to do |format|
        if @tweet.save
          format.html { redirect_to root_path, notice: "Tweet was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)    
  end

end
