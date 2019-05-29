class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :join_table_cart_item, dependent: :destroy
  has_many :carts, through: :join_table_cart_item

  has_many :join_table_order_items, dependent: :destroy
  has_many :carts, through: :join_table_order_items
  # TODO: allow minimum char for title to be eq. to 3
  validates :title,
  presence: true,
  length: { in: 4..30 }

  validates :description,
  presence: true,
  length: { in: 10..140 }

  validates :price,
  presence: true,
  numericality: { only_float: true, greater_than_or_equal_to: 0 }

  validates :image_url,
  presence: true

end
