# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Messorder
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    config.action_mailer.default_url_options = { host: 'messorder.test' }

    config.time_zone = 'Brussels'
    config.i18n.default_locale = :fr
    config.i18n.locale = :fr
    config.i18n.enforce_available_locales = false
    config.active_job.queue_adapter = :sidekiq

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', "local_#{Rails.env}.yml")
      if File.exist?(env_file)
        YAML.safe_load(File.open(env_file)).each do |key, value|
          ENV[key.to_s] = value
        end
      end
    end
  end
end
