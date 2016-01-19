class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
  end

  def follow
    other_user = params[:user]

    if current_user.is_following?(other_user)
      notice = "You will continue following this user"
    else
      Relationship.create(follower_id: current_user.id, followed_id: other_user)
      notice = "You are now following this user"
    end
    redirect_to profile_path(User.find(other_user).username), notice: notice
  end

  def unfollow
    followed = params[:user]
    Relationship.destroy_relationship(current_user.id, followed)
    redirect_to profile_path(User.find(followed).username),
      notice: "You are no longer following this user"
  end
end
