require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'capybara/poltergeist'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.fail_fast = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'
  config.use_transactional_fixtures = false

  # ActiveResource mocks
  require 'support/fakeweb/bill_app'
  config.include BillAppMock

  # Capybara
  # ========

  # DSL for tests
  config.include Capybara::DSL

  # Webkit with Poltergeist/PhantomJS
  require 'capybara/poltergeist'
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new app, window_size: [1280, 1024]
  end

  # Automatic screenshots
  require 'capybara-screenshot/rspec'

  # User sign in
  config.include Warden::Test::Helpers
  Warden.test_mode!
end

Capybara.javascript_driver = :poltergeist
