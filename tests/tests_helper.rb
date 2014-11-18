require "minitest/autorun"
require 'pry'

ENV['RACK_ENV'] = 'test'

Dir['./**/*_test.rb'].each do |file|
  require file
end
