# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.delete_all
Movie.create(file_name: "The Usual Suspects.mp4", moviedb_id: 629, watched: false)
Movie.create(file_name: "Batman.mp4", moviedb_id: 268, watched: false)
Movie.create(file_name: "Batman returns.mp4", moviedb_id: 364, watched: false)
Movie.create(file_name: "Last Action Hero.mp4", moviedb_id: 9593, watched: false)
Movie.create(file_name: "Gladiator.mp4", moviedb_id: 98, watched: false)
Movie.create(file_name: "Citizen Kane.mp4", moviedb_id: 15, watched: false)
Movie.create(file_name: "Jupiter Ascending.mp4", moviedb_id: 76757, watched: false)
Movie.create(file_name: "John Wick.mp4", moviedb_id: 245891, watched: false)

Show.delete_all
(1..rand(5..15)).each do |show_id|
  show = Show.create(moviedb_id: show_id)
  (1..rand(1..15)).each do |season_no|
    season = Season.create(show_id: show.id, season_no: season_no)
    (1..rand(1..24)).each do |episode_no|
      Episode.create(season_id: season.id, episode_no: episode_no, file_name: "show.s#{season_no}e#{episode_no}.mp4", watched: false)
    end
  end
end
