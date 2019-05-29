class UserMailer < ApplicationMailer
  default from: 'chaton-power@yopmail.com'

  def welcome_email(user)
    @user = user
    @url = "https://chaton-power.herokuapp.com"

    mail(to: @user.email, subject: "Welcome to Chaton-power !")
  end

  def order_email(order)
  	@order = order
    @current_user = @order.user
    @cart = @current_user.cart
  	@items = @current_user.cart.items
  	@url = "https://chaton-power.herokuapp.com"
    mail(to: @current_user.email, subject: "Thank you for your order !")
  end

  def admin_order_email(order)
    @order = order
    @user = order.user
    @items = @user.cart.items
    @count = 0.0
      @items.each do |item|
      @count += item.price
      end
    @url = "https://chaton-power.herokuapp.com"
    mail(to: "chaton-power@yopmail.com", subject: "New order :")
  end

end

