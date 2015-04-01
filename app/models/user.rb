class User < ActiveRecord::Base
  # attr_accessible :email, :password, :isMerchant
  has_many :orders
  has_one :food_trucks
end
