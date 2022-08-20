class RemoveOrdersidFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :orders_id, :integer
  end
end
