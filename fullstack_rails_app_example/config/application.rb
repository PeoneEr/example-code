require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module JobsAggregation
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.default_locale = :ru
    config.time_zone = 'Krasnoyarsk'
    config.active_job.queue_adapter = :resque
    config.generators do |g|
      g.test_framework :rspec
    end
    config.generators.stylesheets = false
    config.generators.helpers = false
    config.action_cable.mount_path = '/websocket'
  end
end
