class User < ApplicationRecord
  extend FriendlyId
  friendly_id :first_name, use: :slugged

  after_create :welcome_send
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	after_create :create_cart, :welcome_send

  has_many :favorites
  has_many :items, through: :favorites

  private
  def create_cart
  	Cart.create!(user_id: self.id)
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
