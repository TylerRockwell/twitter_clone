class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @user = User.find_by(username: params[:username]).decorate
    redirect_to posts_path, alert: "Could not find a user with that name" unless @user
  end
end
