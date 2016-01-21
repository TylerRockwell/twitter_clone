class UsersController < ApplicationController
  before_action :set_other_user, only: [:follow, :unfollow]
  def show
    @user = User.find_by(username: params[:username])
    redirect_to posts_path, alert: "Could not find a user with that name" unless @user
  end

  def follow
    if current_user.is_following?(@other_user)
      notice = "You will continue following this user"
    else
      Relationship.create(follower: current_user, followed: @other_user)
      notice = "You are now following this user"
    end
    redirect_to profile_path(@other_user.username), notice: notice
  end

  def unfollow
    Relationship.destroy_relationship(current_user.id, @other_user.id)
    redirect_to profile_path(@other_user.username),
      notice: "You are no longer following this user"
  end

  private

  def set_other_user
    @other_user = User.find(params[:user])
  end
end
