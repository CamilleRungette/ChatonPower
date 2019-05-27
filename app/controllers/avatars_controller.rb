class AvatarsController < ApplicationController
  def create
  	@item = Item.find(params[:item_id])
    @item.avatar.attach(params[:avatar])
    redirect_to(item_path(@item))
  end
end
