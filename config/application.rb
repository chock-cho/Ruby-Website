require_relative 'boot'

# application.rb

require_relative 'boot'

# Psych 오버라이드를 가장 먼저 설정
require 'psych'

module Psych
  class << self
    alias_method :old_safe_load, :safe_load

    def safe_load(yaml, permitted_classes: [], permitted_symbols: [], aliases: false, **kwargs)
      old_safe_load(yaml, permitted_classes: permitted_classes, permitted_symbols: permitted_symbols, aliases: true, **kwargs)
    end
  end
end

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GoormRailsApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end


