class User < ActiveRecord::Base
  validates_uniqueness_of :token
  has_many :orders,  :dependent => :destroy
  has_many :food_trucks, :dependent => :destroy
end
