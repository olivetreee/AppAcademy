class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    render :new
  end

  def create
    new_comment = Comment.new(comment_params)
    new_comment.author_id = current_user.id
    @post = new_comment.post
    if new_comment.valid?
      new_comment.save!
      redirect_to sub_post_url(@post.sub_id, @post)
    else
      flash[:errors] = new_comment.errors.full_messages
      render :new
    end

  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

  def ensure_login
    redirect_to new_session_url unless current_user
  end


end
