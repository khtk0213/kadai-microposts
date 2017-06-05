class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def index
    @user = current_user
    @microposts = current_user.likes
  end

  def create
    @user = current_user
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = Favorite.new(user_id: @user.id, micropost_id: @micropost.id)
    
    if @favorite.save
      flash[:success] = 'お気に入りに設定しました。'
      redirect_to root_url
    end
  end

  def destroy
    @favorite = Favorite.find (params[:id])
    @favorite.destroy
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_url
  end
end