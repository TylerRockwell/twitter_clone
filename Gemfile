source 'https://rubygems.org'

# Use bootstrap so it looks slightly less bad
gem 'bootstrap-sass', '~> 3.3.6'
# User paperclip for user avatar uploads
gem 'paperclip'
# Use slim to simplify templates
gem 'slim'
# Use devise for authentication
gem 'devise'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use draper to keep logic out of views and view logic out of models
gem 'draper', '~> 1.3'

group :development, :test do
  # Use pry-byebug for debugging
  gem 'pry-byebug'
  # Use rspec for testing suite
  gem 'rspec-rails'

  #Use factory_girl for test fixtures
  gem 'factory_girl_rails'

  # Get some great fake data for seeds
  gem 'faker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rails-footnotes', '~> 4.0'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.0'
end
