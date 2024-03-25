class UsersController < ApplicationController

  require 'themoviedb-api'
  Tmdb::Api.key("de02a1639be95fbfec0058fd054d9de5")
  Tmdb::Api.language("ja")


  def show
   @user = User.find(params[:id])
   @flogs = WrritenFlog.where(movie_id: params[:id]).reverse_order.page(params[:page]).per(6)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

    private

  def user_params
    params.require(:user).permit(:nickname, :email, :image, :introduction)
  end

end
