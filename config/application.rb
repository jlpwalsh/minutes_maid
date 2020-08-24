# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv.overload '.env.test' if Rails.env.test?
Dotenv.overload '.env' if !Rails.env || Rails.env.development?

module MinutesMaid
  ##
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # init Google Maps API
    Google::Maps.configure do |config|
      config.authentication_mode = Google::Maps::Configuration::API_KEY
      config.api_key = ENV['MM_GOOGLE_API_KEY'] || ''
    end
  end
end
