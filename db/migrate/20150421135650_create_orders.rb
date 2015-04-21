class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.references :food_truck, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :users
    add_foreign_key :orders, :food_trucks
  end
end
