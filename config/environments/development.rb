Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_controller.action_on_unpermitted_parameters = :raise

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # # ActionMailer
  # config.action_mailer.raise_delivery_errors = false # Don't care if the mailer can't send.
  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = { address: 'localhost', port: 1025 }
  # config.action_mailer.default_url_options = { host: 'brutto.dev' }

  # Gem rails-dev-tweaks
  config.dev_tweaks.log_autoload_notice = false
  config.dev_tweaks.autoload_rules do
    keep :all

    skip '/favicon.ico'
    skip :assets
    keep :forced
  end

  # Bullet
  if defined? Bullet
    config.after_initialize do
      Bullet.enable = true
      if ENV['GROWL_ENABLED'] == '1'
        Bullet.growl = { quiet: true }
      end
      Bullet.bullet_logger = true
      Bullet.console = true
      Bullet.rails_logger = false
    end
  end

  # I18n debugging
  I18nLogger = ActiveSupport::Logger.new(Rails.root.join('log/i18n.log'))
end
