$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'apps/lib'))

require 'bundler/setup'
require 'sinatra/base'
require 'app/base'

require './apps/controllers/hello_controller'
ROUTES = {
  '/' => HelloController
}


run Rack::URLMap.new ROUTES

