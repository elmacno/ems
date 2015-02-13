class ShowsController < ApplicationController
  def index
    @shows = Show.all
  end

  def show
    if params[:id]
      @show = Show.find_by(moviedb_id: params[:id])
      @seasons = @show.seasons unless @show.nil?
      if @seasons && params[:season]
        @season = @seasons.find_by(season_no: params[:season])
        @episodes = @season.episodes unless @season.nil?
        if @episodes && params[:episode]
          @episode = @episodes.find_by(episode_no: params[:episode])
        end
      end
    end
  end

  def season
    if params[:id]
      @show = Show.find_by(moviedb_id: params[:id])
      @seasons = @show.seasons unless @show.nil?
      if @seasons && params[:season]
        @season = @seasons.find_by(season_no: params[:season])
      end
    end
  end

  def episode
    if params[:id]
      @show = Show.find_by(moviedb_id: params[:id])
      @seasons = @show.seasons unless @show.nil?
      if @seasons && params[:season]
        @season = @seasons.find_by(season_no: params[:season])
        @episodes = @season.episodes unless @season.nil?
        if @episodes && params[:episode]
          @episode = @episodes.find_by(episode_no: params[:episode])
        end
      end
    end
  end
end
