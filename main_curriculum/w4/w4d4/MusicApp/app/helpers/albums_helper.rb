module AlbumsHelper
  def sorted_tracks
    @tracks.sort { |a,b| a.position <=> b.position }
  end
end
