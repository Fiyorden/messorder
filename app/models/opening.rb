class Opening < ApplicationRecord
    include ApplicationHelper
    scope :week, -> { where(from_at: ((Date.today.beginning_of_day)..(Date.today.next_occurring(:sunday).end_of_day)))}
    def name
        "#{getDate(self.from_at)} de #{to_time(self.from_at)} - #{to_time(self.to_at)}"
    end
end
