require "minitest/autorun"

ENV['RACK_ENV'] = 'test'

Dir['./**/*_test.rb'].each do |file|
  require file
end
