class FoodTruck < ActiveRecord::Base
  # attr_accessible :foodTruckID, :merchantUserEmail, :name, :type, :longitude, :latitude
  belongs_to :user
  has_many :menu_items
end
