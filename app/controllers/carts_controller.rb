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

  def destroy
    @item = User.find(current_user.id).cart.items.find(params[:id])
    @cart = JoinTableCartItem.where(cart_id: current_user.cart).find_by(item_id: @item.id)
    @cart.destroy
    redirect_to user_carts_path(current_user.id)
  end
end
