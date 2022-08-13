class AddCustomerIdToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :customer_id, :integer
  end
end
