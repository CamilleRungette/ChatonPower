class JoinTableCartItem < ApplicationRecord
  belongs_to :cart, dependent: :destroy
  belongs_to :item
end
