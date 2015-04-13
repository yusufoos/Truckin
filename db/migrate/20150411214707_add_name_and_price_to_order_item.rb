class AddNameAndPriceToOrderItem < ActiveRecord::Migration
  def change
    add_column :order_items, :name, :string
    add_column :order_items, :price, :float
  end
end
