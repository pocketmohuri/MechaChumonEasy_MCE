class CreateAdminOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_order_details do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order_id"
    t.integer "price"
    t.integer "amount"
    t.integer "making_status", default: 0
    t.integer "menu_id"
    end
  end
end
