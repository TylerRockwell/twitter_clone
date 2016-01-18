class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
  end

  def follow
    followed = params[:user]

    if current_user.already_following(followed)
      notice = "You will continue following this user"
    else
      Relationship.create(follower_id: current_user.id, followed_id: followed)
      notice = "You are now following this user"
    end
    redirect_to profile_path(User.find(followed).username), notice: notice
  end
end
