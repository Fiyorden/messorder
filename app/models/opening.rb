# frozen_string_literal: true

class Opening < ApplicationRecord
  include ApplicationHelper
  scope :week, -> { where(from_at: ((Date.today.beginning_of_day)..(Date.today.next_occurring(:sunday).end_of_day))) }
  def name
    "#{getDate(from_at)} de #{to_time(from_at)} - #{to_time(to_at)}"
  end
end
