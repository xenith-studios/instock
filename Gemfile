source 'http://rubygems.org'

gem 'rails', '3.1.0.rc1'


# Asset template engines
gem 'sass'
#gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'
gem 'shopify_api'
gem 'shopify_app'
gem 'hoptoad_notifier'
gem 'authlogic'
gem 'json_pure'
gem 'heroku'
gem 'client_side_validations'
#gem 'formtastic'
gem 'execjs'

gem 'thin'

# This is only as a stopgap measure until some things can be rewritten to not use error_messages_for
gem 'dynamic_form'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :production do
  gem 'therubyracer-heroku', '0.8.1.pre3'
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'webrat'
  gem 'rspec-rails'
  gem 'autotest'
#  gem 'ZenTest'
  gem 'test_notifier'
#  gem 'spork'
  gem 'watchr'
end

group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'rspec-rails'
  gem 'spark'
  gem 'launchy'
end
