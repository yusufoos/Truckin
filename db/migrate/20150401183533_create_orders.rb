class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :OrderID
      t.string :CustomerUserEmail

      t.timestamps null: false
    end
  end
end
