class Order < ApplicationRecord

  has_many :order_details
  belongs_to :customer_table


end
