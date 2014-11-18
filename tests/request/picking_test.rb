require_relative '../../my_app'
require 'rack/test'

class Fungileaks::PickingTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Fungileaks::App
  end

  def test_index_returns_success
    get '/v1/pickings'
    assert last_response.ok?
  end

  def test_index_returns_json
    get '/v1/pickings'
    assert(JSON.parse(last_response.body).kind_of? Array)
  end

  def test_index_returns_all_pickings
    get '/v1/pickings'

  end
end
