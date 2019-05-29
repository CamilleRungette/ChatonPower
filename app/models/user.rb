class User < ApplicationRecord
  after_create :welcome_send
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	after_create :create_cart, :welcome_send

  private
  def create_cart
  	Cart.create!(user_id: self.id)
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
