class MoviesController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key("de02a1639be95fbfec0058fd054d9de5")
  Tmdb::Api.language("ja")

  def show
    @search = Tmdb::Movie.detail(params[:id])
    @movie_title = @search["title"]
    @movie_poster = @search["poster_path"]
    @movie_story = @search["overview"]

  end
end
