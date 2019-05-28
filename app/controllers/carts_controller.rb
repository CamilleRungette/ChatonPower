class CartsController < ApplicationController
  def index
    @cart = User.find(current_user.id).cart
    if @cart == nil
      redirect_to root_path
    else
      @items = User.find(current_user.id).cart.items
    end
  end
end
