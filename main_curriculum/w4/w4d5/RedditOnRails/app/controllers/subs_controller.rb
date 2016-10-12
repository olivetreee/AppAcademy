require 'byebug'

class SubsController < ApplicationController

  before_action :ensure_login
  before_action :ensure_moderator, only: [:edit, :update, :destroy]

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    new_sub = Sub.new(sub_params)
    new_sub.moderator_id = current_user.id
    if new_sub.valid?
      new_sub.save!
      redirect_to sub_url(new_sub)
    else
      flash[:errors] = new_sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
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

  def ensure_moderator
    @sub = Sub.find(params[:id])
    if @sub.moderator != current_user
      render text: "403 Forbidden", status: :forbidden
    end
  end
end
