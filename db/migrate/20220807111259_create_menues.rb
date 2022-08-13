class CreateMenues < ActiveRecord::Migration[6.1]
  def change
    create_table :menues do |t|
    t.integer :menues_id
    t.string :name
    t.text :introduction
    t.integer :price
    t.boolean :is_active

      t.timestamps
    end
  end
end
