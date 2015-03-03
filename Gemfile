source 'https://rubygems.org'

ruby '2.1.2'

gem 'grape'
gem 'grape-swagger'
gem 'rack-cors'
gem 'sinatra'

gem 'bson_ext'
gem 'mongoid'

group :test do
  gem 'rack-test'
  gem 'database_cleaner'
  gem 'mongoid-tree' # required by database cleaner
end

group :development, :test do
  gem 'pry'
end
