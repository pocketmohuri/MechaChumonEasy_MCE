class AddCustomerTablesIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :Customer_tables_id, :integer
  end
end
