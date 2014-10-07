require "minitest/autorun"
Dir['./**/*_test.rb'].each do |file|
  require file
end
