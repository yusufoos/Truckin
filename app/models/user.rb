class User < ActiveRecord::Base
    has_many :food_trucks, :dependent => :delete_all
    has_many :orders, :dependent => :delete_all
end
