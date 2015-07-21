require 'rack-flash'
require 'rack/contrib'

require 'sinatra/activerecord'
require 'i18n'
require 'i18n/backend/fallbacks'

require 'logger'
require 'slim'
require 'bcrypt'

module App
  class Base < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    configure :development do
      require 'sinatra/reloader'
      #変更があった場合にサーバーをリロードする
      register Sinatra::Reloader
      also_reload 'app/**/*.rb'
      also_reload 'lib/**/*.rb'
      also_reload 'conf/**/*.rb'

      set :raise_errors, true

      require 'better_errors'
      require 'binding_of_caller'
      use BetterErrors::Middleware
      BetterErrors.application_root = __dir__
      BetterErrors::Middleware.allow_ip! "192.168.59.3"
      require 'pry'
    end

    configure do
      set :root, File.dirname(__FILE__) + '/../../../'
      set :views, self.root + 'apps/views'

      set :database_file, self.root + 'config/database.yml'

      ::Logger.class_eval { alias :write :'<<' }
      access_logger = ::Logger.new(self.root + 'log/access.log')
      error_logger  = ::File.new(self.root + 'log/error.log',"a+")
      error_logger.sync = true

      use ::Rack::CommonLogger, access_logger

      # i18n
      I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
      I18n.load_path += Dir[File.join(settings.root + 'config/', 'locales', '*.yml')]

      I18n.backend.load_translations
      I18n.available_locales = [:en, :ja]
      I18n.enforce_available_locales = true
      I18n.default_locale = :ja
    end

    use Rack::Locale

    enable :sessions
    use Rack::Flash

    before '/:locale/*' do
      I18n.locale       =       params[:locale]
      request.path_info = '/' + params[:splat ][0]
    end
  end
end
