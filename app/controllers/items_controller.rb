class ItemsController < ApplicationController
  def index
  	@item = Item.all
  end

  def show
  	@item = Item.friendly.find_by(title: params[:id])
    
  end

  def update
    @item = Item.friendly.find_by(title: params[:id])
    if user_signed_in?
      @cart = current_user.cart.id
      JoinTableCartItem.create!(cart_id: @cart, item_id: @item.id)
      redirect_to root_path
    else
      root_path
    end
  end

  def destroy
    @item = User.find(current_user.id).cart.items.find(params[:id])
    @cart = JoinTableCartItem.where(cart_id: current_user.cart).find_by(item_id: @item.id)
    @cart.delete
    redirect_to user_carts_path(current_user.id)
  end
end
