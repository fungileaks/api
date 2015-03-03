require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

class MiniTest::Test
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end
