class JoinTableCartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
end
