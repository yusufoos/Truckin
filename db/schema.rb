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

ActiveRecord::Schema.define(version: 20150402150517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_trucks", force: :cascade do |t|
    t.string   "merchantUserEmail"
    t.string   "name"
    t.string   "foodType"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.integer  "foodTruckID"
    t.string   "name"
    t.decimal  "price"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "orderID"
    t.integer  "menuItemID"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customerUserEmail"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.boolean  "isMerchant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
