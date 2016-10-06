class AlbumsController < ApplicationController

  before_action :check_if_logged_in

  def check_if_logged_in
    redirect_to new_session_url unless current_user
  end

  def new
    @band = Band.find(params[:band_id])
  end

  def create
    @new_album = Album.new(album_params)
    if @new_album.valid?
      @new_album.save!
      redirect_to album_url(@new_album)
    else
      flash.now[:errors] = @new_album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    if @album
      @tracks = @album.tracks
      render :show
    else
      flash[:messages] = @album.errors.full_messages
      render bands_url
    end
  end


  private

  def album_params
    params.require(:album).permit(:name, :band_id, :album_type)
  end

end
