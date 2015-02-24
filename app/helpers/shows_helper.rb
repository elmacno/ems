module ShowsHelper
  def get_show_name(id)
    movie = Tmdb::TV.detail(id)
    movie["name"]
  end

  def get_episode_name(show_id, season_no, episode_no)
    episode = Tmdb::Episode.detail(show_id, season_no, episode_no)
    "#{episode["name"]} (S#{season_no}E#{episode_no})"
  end

  def get_playable_show_url(file_name)
    "smb://192.168.1.2/nas/Media/Tv%20Shows/#{file_name}"
  end
end
