class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_config
  Tmdb::Api.key("65d17b9df1ef1475d6c78956d1e0af12")

  def set_config
    @moviedb_config = Tmdb::Configuration.new

    Paginate.configure do |config|
      config.size = 5
      config.param_name = :p
    end
  end
end
