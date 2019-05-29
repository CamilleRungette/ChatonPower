class AvatarsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    redirect_to(user_path(@user))
  end

  def destroy
    @user = User.find(params[:user_id])
    @user.avatar.purge
    redirect_to(user_path(@user))
  end
end
