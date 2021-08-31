class FollowsController < ApplicationController
  def create
    user = User.find(params[:id])
    follower = current_user
    @follow = Follow.create(user_id: user.id, follower_id: follower.id)

    if @follow.save
      redirect_to root_path, notice: "You started to follow @#{user.name}!"
    else
      redirect_to root_path, notice: "You cannot follow this user"
      #crear una vista de errores que se llame desde el index con render
    end
  end

  def destroy
    user = User.find(params[:id])
    @follow = user.follows.find_by(follower_id: current_user)
    @follow.destroy
    redirect_to root_path, notice: "You stopped following @#{user.name}"
  end
end
