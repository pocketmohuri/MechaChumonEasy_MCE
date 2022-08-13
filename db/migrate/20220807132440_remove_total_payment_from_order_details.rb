class RemoveTotalPaymentFromOrderDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_details, :total_payment, :integer
  end
end
