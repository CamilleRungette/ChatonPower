class JoinTableCartItemsController < ApplicationController
  def destroy
    @item = JoinTableCartItem.where(cart_id: params[:user_id]).find(1).destroy
    redirect_to root_path
  end
end
