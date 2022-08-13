class AddOrderIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :order_id, :integer
  end
end
