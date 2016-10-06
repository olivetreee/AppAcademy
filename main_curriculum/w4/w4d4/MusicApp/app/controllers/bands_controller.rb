class BandsController < ApplicationController

  before_action :check_if_logged_in

  def check_if_logged_in
    redirect_to new_session_url unless current_user
  end

  def index
    @bands = Band.all
    render :index
  end

  def new
  end

  def show
    @band = Band.find(params[:id])
    if @band
      @albums = @band.albums
      render :show
    else
      flash[:messages] = @band.errors.full_messages
      render bands_url
    end
  end

  def create
    @new_band = Band.new(band_params)
    if @new_band.valid?
      @new_band.save!
      redirect_to band_url(@new_band)
    else
      flash.now[:errors] = @new_band.errors.full_messages
      render :new
    end
  end


  private

  def band_params
    params.require(:band).permit(:name)
  end
end
