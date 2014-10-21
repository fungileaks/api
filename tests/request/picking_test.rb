require_relative '../../my_app'
require 'rack/test'

class Fungileaks::PickingTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Fungileaks::App
  end

  def test_index_returns_success
    get '/api/v1/pickings'
    assert last_response.ok?
  end

end
