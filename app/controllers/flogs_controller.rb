class FlogsController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key("de02a1639be95fbfec0058fd054d9de5")
  Tmdb::Api.language("ja")

  def index
    @user = current_user
    @flogs = @user.wrriten_flogs.reverse_order.page(params[:page]).per(6)
  end

  def show
   @search = Tmdb::Movie.detail(params[:id])
   @movie_title = @search["title"]
   @movie_poster = @search["poster_path"]
   @movie_story = @search["overview"]

   @flogs = WrritenFlog.where(movie_id: params[:id]).reverse_order.page(params[:page]).per(6)

  end

  def new
    @wrriten_flog = WrritenFlog.new
    @search = Tmdb::Movie.detail(params[:id])
    @movie_title = @search["title"]
    @movie_poster = @search["poster_path"]
    @movie_story = @search["overview"]
  end

  def create
    @flog = WrritenFlog.new(wrriten_flog_params)
    @flog.movie_id = params[:wrriten_flog][:movie_id].to_i
    @flog.user_id = current_user.id
    @flog.save
    my_list = MyList.find_by(movie_id: @flog.movie_id , user_id: @flog.user_id)
    my_list.destroy if my_list.present?

    redirect_to flogs_path
  end

  def edit
    @flog = WrritenFlog.find(params[:id])
  end

  def update
    flog = WrritenFlog.find(params[:id])
    flog.update(wrriten_flog_params)
    redirect_to flogs_path
  end

  def destroy
    flog = WrritenFlog.find(params[:id])
    flog.destroy
    redirect_to flogs_path
  end

  private
  def wrriten_flog_params
    params.require(:wrriten_flog).permit(:score, :review, :movie_id, :movie_title, :movie_poster)
  end

end
