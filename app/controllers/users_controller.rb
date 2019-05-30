class UsersController < ApplicationController
  before_action :authenticate?, only: [:show]
  before_action :your_profile?, only: [:show]

  def show
    @user = User.friendly.find(params[:id])
  end

  private

  def authenticate?
    redirect_to root_path unless user_signed_in?
  end

  def your_profile?
    if current_user != User.friendly.find(params[:id])
      redirect_to root_path
    end
    # redirect_to root_path if current_user.is_admin != true &&
  end
end
