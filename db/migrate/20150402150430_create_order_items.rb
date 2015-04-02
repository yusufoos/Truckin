class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :orderID
      t.integer :menuItemID
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
