ENV['RACK_ENV'] ||= 'test'

require "minitest/autorun"
require_relative '../my_app'

begin
  require 'pry'
rescue LoadError
end


Dir[File.dirname(__FILE__)+'/support/*.rb'].each do |file|
  require file
end


Dir['./**/*_test.rb'].each do |file|
  require file
end

