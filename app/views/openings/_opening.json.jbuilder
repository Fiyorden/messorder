# frozen_string_literal: true

date_format = '%Y-%m-%d %H:%M%z'
json.extract! opening, :id
json.show_url opening_url(opening, format: :html)
json.title("Service de #{to_time(opening.from_at)} à #{to_time(opening.to_at)}")
json.start opening.from_at.strftime(date_format)
json.end opening.to_at.strftime(date_format)
