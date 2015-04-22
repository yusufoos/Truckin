class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :food_truck
  has_many :order_items, :dependent => :destroy
  # before_destroy {|order| OrderItem.destroy_all "order_id = #(order.id)"}
end
