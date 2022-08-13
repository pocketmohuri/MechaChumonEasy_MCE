class ChangeCustomerTableId < ActiveRecord::Migration[6.1]
  def change
    remove_column :cart_items, :customer_id, :integers
    remove_column :orders, :Customer_tables_id, :integers

    add_reference :cart_items, :customer_table, foreign_key: true
    add_reference :orders, :customer_table, foreign_key: true
  end
end
