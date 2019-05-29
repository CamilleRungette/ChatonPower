class OrdersController < ApplicationController

  def show
    @user = current_user
    @cart = current_user.cart
    @order = Order.create(user_id: current_user.id)
    @cart.items.each do |item|
      JoinTableOrderItem.create!(
        order_id: @order.id,
        item_id: item.id
      )
    end
    @cart.items.clear
    @total = Array.new
    @order.items.each do |item|
      @total << item.price
    end
    @total = @total.inject(:+)
  end
end
