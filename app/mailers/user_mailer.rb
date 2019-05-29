class UserMailer < ApplicationMailer
  default from: 'chaton-power@yopmail.com'

  def welcome_email(user)
    @user = user
    @url = "https://chaton-power.herokuapp.com"

    mail(to: @user.eamil, subject: "Welcome to Chaton-power !")
  end

end
