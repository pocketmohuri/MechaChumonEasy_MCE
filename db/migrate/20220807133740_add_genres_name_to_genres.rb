class AddGenresNameToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :genres_name, :string
  end
end
