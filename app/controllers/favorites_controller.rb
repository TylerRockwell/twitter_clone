class FavoritesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_post

  def create
    unless current_user.has_favorite?(@post)
      Favorite.create(user_id: current_user.id, post_id: @post.id )
    end
    redirect_to posts_path
  end

  def destroy
    Favorite.destroy_favorite(current_user.id, @post.id)
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
