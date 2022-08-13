class RemoveNameFromGenres < ActiveRecord::Migration[6.1]
  def change
    remove_column :genres, :name, :string
  end
end
