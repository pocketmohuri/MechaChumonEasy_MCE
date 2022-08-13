class RemoveCustomerFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :customer, :integer
  end
end
