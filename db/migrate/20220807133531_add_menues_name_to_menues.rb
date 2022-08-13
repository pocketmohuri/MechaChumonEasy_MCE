class AddMenuesNameToMenues < ActiveRecord::Migration[6.1]
  def change
    add_column :menues, :menues_name, :string
  end
end
