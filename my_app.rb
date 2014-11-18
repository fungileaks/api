require_relative 'config/application.rb'

module Fungileaks

  class API < Grape::API
    VERSION = 'v1'
    version VERSION, using: :path
    format :json
    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    resource :pickings do
      desc 'List all pickings'

      get do
        Picking.all
      end

      desc 'List the last 10 pickings'

      get :latest do
        Picking.order_by('picked_at DESC').limit(10)
      end

      desc 'Return a picking by its ID'
      route_param :id do
        get do
          Picking.find(params[:id])
        end
      end

      desc 'Create a new picking'
      params do
        requires :picked_at, type: String, desc: 'The date you picked those'
        requires :username, type: String, desc: 'Your desired user name'
        requires :species, type: String, desc: 'The king of mushroom you picked'
        requires :latlng, type: String, desc: 'Latitude/longitude, comma separated'
      end
      post do
        picking = Fungileaks::Picking.new declared(params)
        picking.save!
        picking
      end
    end
    add_swagger_documentation api_version: VERSION
  end

  class Web < Sinatra::Base
    get '/' do
      'Hello World'
    end
  end

  class App < Grape::API
    mount Web
    mount API
  end

end

