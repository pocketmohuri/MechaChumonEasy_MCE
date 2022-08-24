class CustomerTable < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :cart_items
  has_many :orders
  has_many :admin_orders

  validates :email, uniqueness: true
  validates :customer_tables_name, uniqueness: true

  def has_in_cart(menu)
    cart_items.find_by(menu_id: menu.id)
  end

end
