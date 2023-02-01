# frozen_string_literal: true

class Type < ApplicationRecord
  has_many :dishes
  scope :actif, -> { where(enabled: true) }
end
