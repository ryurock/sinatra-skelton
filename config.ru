$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'apps/lib'))

require 'bundler/setup'
require 'sinatra/base'
require 'app/base'

require './apps/controllers/default_controller'
require './apps/controllers/debug_controller'
ROUTES = {
  '/debug' => DebugController,
  '/' => DefaultController
}


run Rack::URLMap.new ROUTES

