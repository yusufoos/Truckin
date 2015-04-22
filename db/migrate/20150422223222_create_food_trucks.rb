class CreateFoodTrucks < ActiveRecord::Migration
  def change
    create_table :food_trucks do |t|
      t.string :merchantUserEmail
      t.string :name
      t.string :foodType
      t.float :longitude
      t.float :latitude
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :food_trucks, :users
  end
end
