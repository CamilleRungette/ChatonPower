class ItemsController < ApplicationController
  def index
  	@item = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  def destroy
    @item = User.find(current_user.id).cart.items.find(params[:id])
    @cart = JoinTableCartItem.where(cart_id: current_user.cart).find_by(item_id: @item.id)
    @cart.destroy
    redirect_to user_carts_path(current_user.id)
  end
end
