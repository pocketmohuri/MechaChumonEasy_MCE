class Menu < ApplicationRecord

  #self.table_name = "menus"

  belongs_to :genre
  has_many :cart_items
  has_many :order_details

end
