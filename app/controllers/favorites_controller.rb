class FavoritesController < ApplicationController
  before_filter :authenticate_user!

  def create
    favorite = Favorite.new(user_id: current_user.id, post_id: params[:id])
    flash[:alert] = "Could not save favorite" unless favorite.save
    redirect_to posts_path
  end

  def destroy
    post_id = params[:id]
    favorite = Favorite.find_favorite(current_user.id, post_id)
    favorite.destroy
    redirect_to posts_path
  end
end
