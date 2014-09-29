require 'grape'
require 'mongoid'
require './models/picking'

Mongoid.load!('config/mongoid.yml', ENV['RACK_ENV'].to_sym)

module Fungileaks
  class API < Grape::API
    version 'v1', using: :path

    resource :pickings do
      desc 'List the latest pickings'
      get :latest do
        Picking.order_by('picked_at DESC').limit(10).map(&:as_json)
      end
    end
  end
end
