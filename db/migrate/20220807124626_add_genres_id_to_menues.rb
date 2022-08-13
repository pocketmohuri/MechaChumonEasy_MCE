class AddGenresIdToMenues < ActiveRecord::Migration[6.1]
  def change
    add_column :menues, :genres_id, :integer
  end
end
