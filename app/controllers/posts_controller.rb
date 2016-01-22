class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :favorite, :unfavorite]
  before_action :block_unauthorized_changes, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @posts = Post.where(user_id: current_user.following.ids)
      .includes(:user, :users_who_favorited).decorate
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_url, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_url, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def favorite
    unless current_user.has_favorite?(@post)
      Favorite.create(user_id: current_user.id, post_id: @post.id )
    end
    redirect_to posts_path
  end

  def unfavorite
    Favorite.destroy_favorite(current_user.id, @post.id)
    redirect_to posts_path
  end

  private
    def set_post
      @post = Post.find(params[:id]).decorate
    end

    def block_unauthorized_changes
      unless @post.user == current_user
        redirect_to posts_url, alert: 'You do not have permission to do that'
      end
    end

    def post_params
      params.require(:post).permit(:user_id, :content)
    end
end
