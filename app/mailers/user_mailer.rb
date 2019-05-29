class UserMailer < ApplicationMailer
  default from: 'chaton-power@yopmail.com'

  def welcome_email(user)
    @user = user
    @url = "https://chaton-power.herokuapp.com"

    mail(to: @user.email, subject: "Welcome to Chaton-power !")
  end

  def order_email(user)
  	@user = user
  	@url = "https://chaton-power.herokuapp.com"
    mail(to: @user.email, subject: "Thank you for your order !")

  end

end
