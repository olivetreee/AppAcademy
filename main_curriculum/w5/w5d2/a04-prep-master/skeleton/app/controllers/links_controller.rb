class LinksController < ApplicationController

  before_action :ensure_login

  def new
    @new_link = Link.new
  end

  def create
    @new_link = Link.new(link_params)
    @new_link.user = current_user
    if @new_link.valid?
      @new_link.save
      redirect_to link_url(@new_link)
    else
      flash[:errors] = @new_link.errors.full_messages
      render :new
    end
  end

  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = current_user.links.find(params[:id])
    if @link.update(link_params)
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
