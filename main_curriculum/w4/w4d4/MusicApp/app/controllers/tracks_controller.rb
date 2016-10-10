require 'byebug'
class TracksController < ApplicationController

  before_action :check_if_logged_in

  def check_if_logged_in
    redirect_to new_session_url unless current_user
  end

  def show
    @track = Track.find(params[:id])
    if @track
      render :show
    else
      flash[:messages] = @track.errors.full_messages
      render bands_url
    end
  end

  def new
    @album = Album.find(params[:album_id])
    @track = Track.new(album_id: @album.id)
    render :new
  end

  def create
    @new_track = Track.new(track_params)
    album = Album.find(track_params[:album_id])
    if @new_track.valid?
      @new_track.save!
      redirect_to album_url(album)
    else
      flash.now[:errors] = @new_track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    @album = @track.album
    render :edit
  end

  def update
    track_to_update = Track.find(params[:id])
    if track_to_update.update(track_params)
      redirect_to track_url(track_to_update)
    else
      flash.now[:errors] = track_to_update.errors.full_messages
      @track = track_to_update
      render :edit
    end
  end

  def track_params
    params.require(:track).permit(:name, :album_id, :track_type, :position, :lyrics)
  end

end
