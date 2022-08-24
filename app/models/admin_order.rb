class AdminOrder < ApplicationRecord
  has_many :admin_order_details
  belongs_to :customer_table
end
