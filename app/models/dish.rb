# frozen_string_literal: true

class Dish < ApplicationRecord
  belongs_to :type
  has_and_belongs_to_many :orders
  has_one_attached :picture do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  scope :actif, -> { where(enabled: true) }
end
