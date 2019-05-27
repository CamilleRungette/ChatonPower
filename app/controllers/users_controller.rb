class UsersController < ApplicationController
  def index
  end

  def show
  @user = User.find(params[:id])
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
