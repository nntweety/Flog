class UserListsController < ApplicationController
  def follow_list
    @user = User.find(params[:user_id])
    @follow_user = Follow.where(follower_id: params[:user_id])
  end

  def followed_list
    @user = User.find(params[:user_id])
    @followed_user = Follow.where(followed_id: params[:user_id])
  end
  
end
