# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_14_102045) do

  create_table "admins", force: :cascade do |t|
    t.integer "admin_id"
    t.string "last_name"
    t.string "first_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "admin_status"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "amount"
    t.integer "menu_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "customer_table_id"
    t.index ["customer_table_id"], name: "index_cart_items_on_customer_table_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "comment_id"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order_id"
  end

  create_table "customer_tables", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.integer "customer_tables_id"
    t.string "customer_tables_name"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customer_tables_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customer_tables_on_reset_password_token", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.boolean "is_deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "customer_id"
  end

  create_table "genres", force: :cascade do |t|
    t.integer "genres_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "genres_name"
    t.boolean "is_active", default: true, null: false
  end

  create_table "menus", force: :cascade do |t|
    t.text "introduction"
    t.integer "price"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "menu_name"
    t.integer "genre_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_details_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order_id"
    t.integer "price"
    t.integer "amount"
    t.integer "making_status"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "orders_id"
    t.integer "total_payment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "customer_id"
    t.integer "status"
    t.integer "customer_table_id"
    t.index ["customer_table_id"], name: "index_orders_on_customer_table_id"
  end

  add_foreign_key "cart_items", "customer_tables"
  add_foreign_key "orders", "customer_tables"
end
