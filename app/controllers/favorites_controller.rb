class FavoritesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_post

  def create
    favorite = Favorite.new(user_id: current_user.id, post_id: @post.id)
    flash[:alert] = "Could not save favorite" unless favorite.save
    redirect_to posts_path
  end

  def destroy
    favorite = Favorite.find_favorite(current_user.id, @post.id)
    favorite.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
