class CartsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    
    if user_signed_in?
      @cart = User.find(current_user.id).cart
    else
      redirect_to root_path # Si le user tente d'accéder au panier sans sign in
    end

    @items = User.find(current_user.id).cart.items if @cart != nil # Si le panier est vide
  end
end
