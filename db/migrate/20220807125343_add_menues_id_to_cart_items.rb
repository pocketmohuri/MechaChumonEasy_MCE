class AddMenuesIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :menues_id, :integer
  end
end
