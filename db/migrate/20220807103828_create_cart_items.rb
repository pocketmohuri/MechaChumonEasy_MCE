class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :amount
      t.integer :menu_id

      t.timestamps
    end
  end
end
