class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(:file_name)
  end

  def show
    if params[:id]
      puts "Getting movie by id"
      @movie = Movie.find_by(moviedb_id: params[:id])
    end
  end
end
