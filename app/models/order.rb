class Order < ActiveRecord::Base
  # attr_accessible :OrderID, :customerUserEmail
  belongs_to :user
  has_many :order_items
end
