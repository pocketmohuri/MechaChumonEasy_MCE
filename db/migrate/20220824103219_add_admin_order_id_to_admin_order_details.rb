class AddAdminOrderIdToAdminOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_order_details, :admin_order_id, :integer
  end
end
