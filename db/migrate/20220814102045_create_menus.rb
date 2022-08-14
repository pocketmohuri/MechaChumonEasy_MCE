class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
     t.text "introduction"
     t.integer "price"
     t.boolean "is_active"
     t.datetime "created_at", precision: 6, null: false
     t.datetime "updated_at", precision: 6, null: false
     t.string "menu_name"
     t.integer "genre_id"

     #t.timestamps
    end
  end
end
