# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150422223222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_trucks", force: :cascade do |t|
    t.string   "merchantUserEmail"
    t.string   "name"
    t.string   "foodType"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "food_trucks", ["user_id"], name: "index_food_trucks_on_user_id", using: :btree

  create_table "menu_items", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.string   "description"
    t.integer  "food_truck_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "menu_items", ["food_truck_id"], name: "index_menu_items_on_food_truck_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity"
    t.decimal  "price"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "food_truck_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "orders", ["food_truck_id"], name: "index_orders_on_food_truck_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.boolean  "isMerchant"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "food_trucks", "users"
  add_foreign_key "menu_items", "food_trucks"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "food_trucks"
  add_foreign_key "orders", "users"
end
