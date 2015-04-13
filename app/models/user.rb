class User < ActiveRecord::Base
    has_many :food_trucks
    has_many :orders
end
