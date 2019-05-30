class FavoritesController < ApplicationController
  def index
    @user_favorite = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.create(user_id: current_user.id, item_id: params[:item_id])
    if @favorite.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, item_id: params[:item_id])
    @favorite.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
  end
end
