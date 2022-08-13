class AddMenuesIdToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :menues_id, :integer
  end
end
