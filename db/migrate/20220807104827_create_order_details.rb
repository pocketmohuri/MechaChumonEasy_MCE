class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_details_id
      t.integer :total_payment
      t.boolean :status
      t.integer :menu_id


      t.timestamps
    end
  end
end
