class OrdersController < ApplicationController

  def new
    @items = User.find(current_user.id).cart.items
    @amount = 0 
    @items.each do |item| 
      @amount += item.price
    end 
  end

  def create
    @items = User.find(current_user.id).cart.items
    @amount = 0 
    @items.each do |item| 
      @amount += item.price
    end 

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: (@amount.to_i)*100,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
  redirect_to user_cart_order_path(current_user.id, current_user.cart.id, current_user.id)
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

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
