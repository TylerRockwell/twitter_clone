class RelationshipsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_other_user, only: [:create, :destroy]
  before_action :set_relationship, only: :destroy
  
  def create
    @relationship = Relationship.new(follower: current_user, followed: @other_user)
    if @relationship.save
      flash[:notice] = "You are now following #{@other_user.username}"
    else
      flash[:error] = "Could not create a relationship with this user."
    end
    redirect_to profile_path(@other_user.username), notice: notice
  end

  def destroy
    @relationship.destroy
    redirect_to profile_path(@other_user.username),
      notice: "You are no longer following #{@other_user.username}"
  end

  private

  def set_other_user
    @other_user = User.find(params[:id])
  end

  def set_relationship
    @relationship = Relationship.find_relationship(current_user.id, @other_user.id)
  end
end
