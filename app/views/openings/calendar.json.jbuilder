# frozen_string_literal: true

json.array! @openings, partial: 'openings/opening', as: :opening
