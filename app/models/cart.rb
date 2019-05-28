class Cart < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :join_table_cart_item, dependent: :destroy
  has_many :items, through: :join_table_cart_item
end
