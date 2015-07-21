$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'apps/lib'))

require 'bundler/setup'
require 'sinatra/base'
require 'app/base'
require 'pry-remote'

require './apps/controllers/default_controller'
require './apps/controllers/auth_controller'
require './apps/controllers/debug_controller'

ROUTES = {
  '/debug'           => DebugController,
  '/'                => DefaultController,
  '/auth'            => AuthController,
}

run Rack::URLMap.new ROUTES

