class ItemsController < ApplicationController
    before_action :authenticate_user, only: [:update, :destroy]

  def index
  	@items = Item.all
  end

  def show
    @item = Item.friendly.find_by(title: params[:id])
  end

  def search
    cleaned_search = params[:search].split.each { |word| word.capitalize! }.join(' ')
    @item = Item.friendly.find_by(title: cleaned_search)
  end

  def update
    @item = Item.friendly.find_by(title: params[:id])
    if user_signed_in?
      @cart = current_user.cart.id
      JoinTableCartItem.create!(cart_id: @cart, item_id: @item.id)
      redirect_to root_path
    else 
      redirect_to root_path
    end
  end

  def destroy
    @item = User.find(current_user.id).cart.items.find(params[:id])
    @cart = JoinTableCartItem.where(cart_id: current_user.cart).find_by(item_id: @item.id)
    @cart.delete
    redirect_to user_carts_path(current_user.id)
  end

private

  def authenticate_user
    unless user_signed_in?
      flash[:danger] = "Please log in, or sign in."

    end
  end

end

