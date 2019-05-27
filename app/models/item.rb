class Item < ApplicationRecord
  # TODO: allow minimum char for title to be eq. to 3
  validates :title,
  presence: true,
  length: { in: 5..30 }

  validates :description,
  presence: true,
  length: { in: 10..140 }

  validates :price,
  presence: true,
  numericality: { only_float: true, greater_than_or_equal_to: 0 }

  validates :image_url,
  presence: true

end
