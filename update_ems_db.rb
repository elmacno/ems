require 'fileutils'
require 'shellwords'
require 'themoviedb'

Tmdb::Api.key("65d17b9df1ef1475d6c78956d1e0af12")
moviedb_config = Tmdb::Configuration.new

media_dir = '/mnt/Storage/Media'
media_extensions = %w(avi mp4 mkv m4v mpg)

def isTvShow?(file)
  !(/s\d{2}e\d{2}/ =~ file.downcase).nil?
end

def isMovie?(file)
  !(/1080p/ =~ file.downcase).nil? && !(/yify/ =~ file.downcase).nil?
end

def update_movies
  media_dir = '/mnt/Storage/Media/Movies'
  media_extensions = %w(avi mp4 mkv m4v mpg)
  media_extensions.each do |ext|
    Dir["#{media_dir}/**/*.#{ext}"].each do |file|
      movie_name = File.basename(file, ".*")
      puts "Processing \'#{movie_name}\'"
      movie_matches = Tmdb::Movie.find(movie_name)
      if movie_matches.length > 0
        movie = Movie.create(file_name: file, moviedb_id: Tmdb::Movie.find(movie_name)[0].id, watched: false)
        if movie.valid?
          movie.save
          puts "\tAdded \'#{movie_name}\' to the database!"
        else
          puts "\t\'#{movie_name}\' s most likely already in the database!"
        end
      else
        puts "\tDon\'t know what \'#{movie_name}\' is."
      end
    end
  end
end

update_movies

#media_extensions.each do |ext|
#  Dir["#{source_dir}/**/*.#{ext}"].each do |file|
#    file_name = File.basename(file)
#    if isTvShow?(file_name) || isTvShow?(File.dirname(file).downcase.split(File::SEPARATOR)[-1])
#      if !file_name.start_with?('sample')
#        dest_file_extension = File.extname(file_name)
#        result = /(?<show_name>.*)\.(?<episode>s\d{2}e\d{2}).*/.match(file_name.downcase)
#        if result.nil?
#          result = /(?<show_name>.*)\.(?<episode>s\d{2}e\d{2}).*/.match(File.dirname(file).downcase.split(File::SEPARATOR)[-1])
#          raise "Everything is wrong!" unless !result.nil?
#        end
#        show_name = result[:show_name]
#        episode = result[:episode]
#        season_no = /s(?<season_no>\d{2})e(?<episode_no>\d{2})/.match(episode)[:season_no].to_i
#        dest_file = media_dir + "/Tv Shows/" + show_name.gsub(/\./, ' ').split.map(&:capitalize).join(' ') + "/Season #{season_no}/" + show_name + "." + episode + dest_file_extension
#        #FileUtils.mv(Shellwords.escape(file), Shellwords.escape(dest_file), {verbose: true})
#        puts "mv #{Shellwords.escape(file)} #{Shellwords.escape(dest_file)}"
#      end
#    elsif isMovie?(file_name)
#      dest_file_extension = File.extname(file)
#      dest_file = media_dir + "/Movies/" + File.basename(file).split('.1080p')[0].gsub(/\./, ' ').gsub(/ \d{4}$/,'').gsub(/  /, '. ') + dest_file_extension
#      #FileUtils.mv(Shellwords.escape(file), Shellwords.escape(dest_file), {verbose: true})
#      puts "mv #{Shellwords.escape(file)} #{Shellwords.escape(dest_file)}"
#    #else
#    #  puts "I don\'t know what file \'#{file}\' is. You need to check it yourself!"
#    end
#  end
#end
