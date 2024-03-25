Rails.application.routes.draw do

  devise_for :users
  get 'user_lists/follow_list/:user_id', to: 'user_lists#follow_list', as: 'user_lists_follow_list'
  get 'user_lists/followed_list/:user_id', to: 'user_lists#followed_list', as: 'user_lists_followed_list'
  root to: 'homes#top'

  resources :users, only: [:show, :edit, :update] do
    get 'mylist', to: 'mylists#target_index'
    resource :follows, only: [:create, :destroy] do
    get 'followings', to: 'follows#followings'
    get 'followers', to: 'follows#followers'
   end
  end

  resources :flogs do
    resource :likes, only: [:create, :destroy]
  end

  resources :movies
  resources :mylists

  get '/user/check', to: 'users#check'
  patch 'user/withdraw', to: 'users#withdraw'
end
