class CartItem < ApplicationRecord
  belongs_to :customer_table
  belongs_to :menu
end
