source 'https://rubygems.org'

ruby '2.1.1'

gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.0.0'
gem 'devise'
gem 'dotenv-rails'
gem 'flutie'
gem 'jquery-rails'
gem 'pg'
gem 'rails', '~> 4.1.1'
gem 'sass-rails', '~> 4.0.3'
gem 'simple_form', '~> 3.1.0.rc1'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'
gem 'activeresource', '~> 4.0.0'

group :development do
  gem 'guard-rspec'
  #gem 'mailcatcher'
  gem 'spring'
  gem 'quiet_assets', '~> 1.0.2'
  gem 'rails-dev-tweaks', '~> 1.1.0'

  # Deployment
  gem 'capistrano', '~> 3.0.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'

  # Debugging
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rack-mini-profiler'
  gem 'bullet', '~> 4.8.0'
  gem 'uniform_notifier', require: false
  gem 'ruby_gntp', require: false
  gem 'rails-i18n-debug', '~> 1.0.2', github: 'xeed/rails-i18n-debug'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'spring-commands-rspec'
  gem 'rspec-rails', '>= 2.14'

  # Debugging
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'awesome_print', require: nil
end

group :staging, :production do
  gem 'newrelic_rpm', '>= 3.6.7'
end

group :test do
  gem 'poltergeist', '>= 1.4.0'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'capybara-screenshot'
  gem 'fakeweb', '~> 1.3'
end
