class RepliesController < ApplicationController

  def new
    @reply = Reply.new
    @post = Post.find(params[:post_id])
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.user_id = current_user.id
    @reply.post_id = params[:post_id]
    @post = Post.find(params[:post_id])
    if @reply.save
      redirect_to [@post, @reply], notice: 'Reply has been saved.'
    else
      alert = "Missing required fields"
      redirect_to show_post_path(id: params[:post_id])
    end
  end

  def show
    @reply = Reply.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  private

  # Only allow a trusted parameter "white list" through.
  def reply_params
    params.require(:reply).permit(:post_id, :content, :user_id)
  end

end
