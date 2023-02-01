# frozen_string_literal: true

Rails.application.config.to_prepare do
  Pay::Charge.include ChargeExtensions
end
