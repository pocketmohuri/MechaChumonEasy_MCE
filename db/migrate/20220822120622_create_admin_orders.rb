class CreateAdminOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_orders do |t|
      t.integer "total_payment"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.integer "status"
      t.integer "customer_table_id"
    end
  end
end
