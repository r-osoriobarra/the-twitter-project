class TweetsController < ApplicationController
  
  def index
    if params[:q]
      @tweets = Tweet.where('content LIKE ?', "%#{params[:q]}%").order(created_at: :desc).page(params[:page])
    else
      @tweets = Tweet.order(created_at: :desc).page(params[:page])
    end
    @tweet = Tweet.new
    @user = current_user
  end

  def show
    @tweet = Tweet.find(params[:id])
    @users = User.all
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
    redirect_to root_path, notice: "Retweet was successfully created."
  end

  def create
    @tweet = Tweet.create(tweet_params)
    @user = current_user
    @tweet.user = @user

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
