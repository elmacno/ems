module MoviesHelper
  def get_movie_name(id)
    movie = Tmdb::Movie.detail(id)
    movie["original_title"]
  end

  def get_movie_poster_path(id)
    movie = Tmdb::Movie.detail(id)
    movie["poster_path"]
  end

  def get_playable_movie_url(file_name)
    "smb://192.168.1.2/nas/Media/Movies/#{file_name}"
  end
end
