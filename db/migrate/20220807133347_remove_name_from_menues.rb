class RemoveNameFromMenues < ActiveRecord::Migration[6.1]
  def change
    remove_column :menues, :name, :string
  end
end
