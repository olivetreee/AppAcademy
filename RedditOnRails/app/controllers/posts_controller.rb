class PostsController < ApplicationController

  before_action :ensure_login

  def new
    @sub = Sub.find(params[:sub_id])
    render :new
  end

  def create
    new_post = Post.new(post_params)
    new_post.author_id = current_user.id
    if new_post.valid?
      new_post.save!
      redirect_to sub_post_url(new_post.sub_id, new_post)
    else
      flash[:errors] = new_post.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end

  def ensure_login
    redirect_to new_session_url unless current_user
  end

end
