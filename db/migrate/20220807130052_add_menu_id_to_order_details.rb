class AddMenuIdToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :menu_id, :integer
  end
end
