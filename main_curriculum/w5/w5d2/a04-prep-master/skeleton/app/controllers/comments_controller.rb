class CommentsController < ApplicationController

  before_action :ensure_login

  def create
    @new_comment = Comment.new(comment_params)
    @new_comment.user = current_user
    @new_comment.save
    flash[:errors] = @new_comment.errors.full_messages
    redirect_to link_url(@new_comment.link)
  end

  def destroy
    comment_to_destroy = Comment.find(params[:id])
    link = comment_to_destroy.link
    comment_to_destroy.delete
    redirect_to link_url(link)
  end

  def comment_params
    params.require(:comment).permit(:body, :link_id)
  end

end
