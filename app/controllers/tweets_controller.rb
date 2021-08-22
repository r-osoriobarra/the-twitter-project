class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.includes(:user)
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
    @user = current_user
  end

  def create
    @tweet = Tweet.create(tweet_params)
    @user = current_user

    @tweet.user = current_user
    @tweet.user_photo = @user.photo

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
