class CartsController < ApplicationController
  def index
    @cart = User.find(current_user.id).cart
    @items = User.find(current_user.id).cart.items if @cart != nil #si le panier est vide
  end
end
