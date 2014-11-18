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
    # TODO
  end

  def test_create_with_valid_params_returns_success
    post '/v1/pickings', valid_create_params
    assert_equal(last_response.status, 201)
  end

  def test_create_with_valid_params_creates_a_picking
    before_count = Fungileaks::Picking.count
    post '/v1/pickings', valid_create_params
    after_count = Fungileaks::Picking.count
    assert_equal(after_count, before_count + 1)
  end

  def test_create_with_invalid_params_responds_with_invalid_request
    post '/v1/pickings', invalid_create_params
    assert_equal(last_response.status, 400)
  end

  private

  def invalid_create_params
    { foo: 'bar' }
  end

  def valid_create_params
    { picked_at: Time.now, username: 'James Bond', species: 'Psylocybes', latlng: '41.34556,2.123' }
  end
end
