class RemoveStatusFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :status, :boolean
  end
end
