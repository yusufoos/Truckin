class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.boolean :isMerchant
      t.string :token

      t.timestamps null: false
    end
  end
end
