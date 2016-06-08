class PostsController < ApplicationController

  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: 'Post has been saved.'
    else
      alert = "Missing required fields"
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end
