class Type < ApplicationRecord
    has_many :dishes
    scope :actif, -> { where(:enabled => true)}
end
