require 'sinatra'
require 'mongoid'
require './models/picking'

Mongoid.load!('config/mongoid.yml', ENV['RACK_ENV'].to_sym)

get '/' do
  'Hello World'
end

post '/api/v1/picking' do
  picking = Fungileaks::Picking.new(params)
  picking.save!
  picking.id.inspect
end
