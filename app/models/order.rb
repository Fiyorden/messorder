class Order < ApplicationRecord
  belongs_to :opening
  belongs_to :user
  has_and_belongs_to_many :dishes
end
