class RemoveGenresNameFromGenres < ActiveRecord::Migration[6.1]
  def change
    remove_column :genres, :genres_name, :integers
  end
end
