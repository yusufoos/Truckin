class User < ActiveRecord::Base
  validates_uniqueness_of :token
  has_many :orders,  :dependent => :delete_all
  has_many :food_trucks, :dependent => :delete_all
end
