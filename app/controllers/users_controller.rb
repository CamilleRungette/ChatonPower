class UsersController < ApplicationController
  before_action :your_profile?, only: [:show]
  before_action :authenticate?, only: [:show]

  def show
  @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def authenticate?
    redirect_to root_path unless user_signed_in?
  end

  def your_profile?
    if current_user != User.find(params[:id])
      redirect_to root_path
    end
    # redirect_to root_path if current_user.is_admin != true && 
  end
end
