class RemoveMenuIdFromOrderDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_details, :menu_id, :integer
  end
end
