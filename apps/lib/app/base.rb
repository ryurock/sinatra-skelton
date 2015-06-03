require 'rack-flash'
require 'sinatra/activerecord'
require 'sinatra/r18n'

require 'logger'
require 'slim'
require 'warden'

module App
  class Base < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    configure :development do
      require 'sinatra/reloader'
      #変更があった場合にサーバーをリロードする
      register Sinatra::Reloader

      require 'better_errors'
      require 'binding_of_caller'
      use BetterErrors::Middleware
      BetterErrors.application_root = __dir__
      BetterErrors::Middleware.allow_ip! "192.168.59.3"
      require 'pry'
    end

    configure do
      register Sinatra::R18n
      set :root, File.dirname(__FILE__) + '/../../../'
      set :views, self.root + 'apps/views'

      set :database_file, self.root + 'config/database.yml'

      ::Logger.class_eval { alias :write :'<<' }
      access_logger = ::Logger.new(self.root + 'log/access.log')
      error_logger  = ::File.new(self.root + 'log/error.log',"a+")
      error_logger.sync = true

      use ::Rack::CommonLogger, access_logger
    end

    enable :sessions
    #auth setting (warden)
    use Rack::Session::Cookie, secret: "IdoNotHaveAnySecret"
  end
end
