class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.references :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :order_items, :orders
  end
end
