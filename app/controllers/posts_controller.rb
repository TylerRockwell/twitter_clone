class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :favorite, :unfavorite]
  before_action :block_unauthorized_changes, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /posts
  def index
    # @posts = Post.all.includes(:user)
    @posts = Post.where(user_id: current_user.following.map(&:id)).includes(:user)
    @user_favorites = current_user.favorites.map
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_url, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to posts_url, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def favorite
    unless current_user.has_favorite?(@post)
      FavoriteHandler.create(user_id: current_user.id, post_id: @post.id )
    end
    redirect_to posts_path
  end

  def unfavorite
    FavoriteHandler.destroy_favorite(current_user.id, @post.id)
    redirect_to posts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      begin
        @post = Post.find(params[:id])
      rescue
        redirect_to posts_url, alert: 'Post could not be found'
      end
    end

    # Stop users from messing with each other's posts
    def block_unauthorized_changes
      unless @post.user == current_user
        redirect_to posts_url, alert: 'You do not have permission to do that'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :content)
    end
end
