class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :food_truck
end
