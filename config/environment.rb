# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  user_name: ENV['MAILJET_APIKEY'],
  password: ENV['MAILJET_SECRET_APIKEY'],
  domain: 'chaton-power.herokuapp.com',
  address: 'smtp.mailjet.com',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
