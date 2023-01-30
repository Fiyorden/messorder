class Dish < ApplicationRecord
  belongs_to :type
  has_and_belongs_to_many :orders
end
