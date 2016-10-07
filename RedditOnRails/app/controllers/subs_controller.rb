class SubsController < ApplicationController

  before_action :ensure_login

  def new
  end

  def create
    new_sub = Sub.new(sub_params)
    new_sub.moderator = current_user.id
    if new_sub.valid?
      new_sub.save!
      redirect_to sub_url(new_sub)
    else
      flash[:errors] = new_sub.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def updated
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def ensure_login
    redirect_to new_session_url unless current_user
  end
end
