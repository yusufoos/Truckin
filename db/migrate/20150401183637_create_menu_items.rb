class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :menuItemID
      t.integer :foodTruckID
      t.string :name
      t.decimal :price
      t.string :description

      t.timestamps null: false
    end
  end
end
