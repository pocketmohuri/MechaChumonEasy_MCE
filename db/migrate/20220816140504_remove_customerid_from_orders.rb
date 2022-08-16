class RemoveCustomeridFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :customer_id, :integer
  end
end
