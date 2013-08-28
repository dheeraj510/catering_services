source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.13'

group :development do
  gem 'sqlite3'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end