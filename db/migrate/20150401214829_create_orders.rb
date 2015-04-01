class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customerUserEmail

      t.timestamps null: false
    end
  end
end
