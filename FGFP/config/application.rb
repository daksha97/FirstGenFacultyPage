require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FGFP
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1


    #TODO: figure out why uncommenting the end of this line throws a CSRF error
    config.session_store :cookie_store, key: '_interslice_session' #, domain: 'http://localhost:3000/auth/google_oauth2/callback'
    config.middleware.use ActionDispatch::Cookies # Required for all session management
    config.middleware.use ActionDispatch::Session::CookieStore, config.session_options

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
