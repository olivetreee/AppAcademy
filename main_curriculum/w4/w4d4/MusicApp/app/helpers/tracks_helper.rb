module TracksHelper
  def checked_type?(type)
    "checked" if type==@track.track_type
  end

  def split_lyrics(lyric)
    lyric.split("\n")
  end
end
