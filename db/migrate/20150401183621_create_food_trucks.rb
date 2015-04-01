class CreateFoodTrucks < ActiveRecord::Migration
  def change
    create_table :food_trucks do |t|
      t.integer :foodTruckID
      t.string :merchantUserEmail
      t.string :name
      t.string :type
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
