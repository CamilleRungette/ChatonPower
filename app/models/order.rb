class Order < ApplicationRecord
  belongs_to :user
  has_many :join_table_order_items, dependent: :destroy
  has_many :items, through: :join_table_order_items


  private 
  def welcome_send
    UserMailer.order_email(self).deliver_now
  end

end
