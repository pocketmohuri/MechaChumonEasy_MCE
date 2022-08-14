class CustomerTable < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :menus
  has_many :cart_items

  validates :email, uniqueness: true
  validates :customer_tables_name, uniqueness: true

end
