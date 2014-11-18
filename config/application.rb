require 'grape'
require 'grape-swagger'

require 'sinatra'

require 'mongoid'
require './models/picking'

Mongoid.load!('config/mongoid.yml', ENV['RACK_ENV'].to_sym)

I18n.enforce_available_locales = false
