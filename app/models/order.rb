class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :food_truck
  has_many :order_items, :dependent => :delete_all
end
