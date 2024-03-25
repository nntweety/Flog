class MylistsController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key("de02a1639be95fbfec0058fd054d9de5")
  Tmdb::Api.language("ja")

  def index
    @user = current_user
    @mylists = @user.my_lists.reverse_order.page(params[:page]).per(8)
  end

  def target_index
    @user = User.find(params[:user_id])
    @mylists = @user.my_lists.reverse_order.page(params[:page]).per(8)
  end

  def create
    @search = Tmdb::Movie.detail(params[:id])
    @mylist = current_user.my_lists.build(movie_id: @search.id ,movie_title: @search["title"], movie_poster: @search["poster_path"])
    @mylist.save

    redirect_to mylists_path
  end

  def destroy
    mylist = MyList.find(params[:id])
    mylist.destroy
    redirect_to mylists_path
  end

end
