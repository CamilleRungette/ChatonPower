class CartsController < ApplicationController
  def index
    @items = User.find(current_user.id).cart.items
  end
end
