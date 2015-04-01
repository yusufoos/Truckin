class OrderItem < ActiveRecord::Base
  # attr_accessible :OrderID, :menuItemID, :quantity
  belongs_to :order
end
