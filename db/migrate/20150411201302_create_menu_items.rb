class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.references :food_truck, index: true

      t.timestamps null: false
    end
    add_foreign_key :menu_items, :food_trucks
  end
end
