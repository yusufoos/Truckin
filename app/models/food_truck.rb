class FoodTruck < ActiveRecord::Base
  belongs_to :user
  has_many :menu_items, :dependent => :destroy
  has_many :orders,  :dependent => :destroy
end
