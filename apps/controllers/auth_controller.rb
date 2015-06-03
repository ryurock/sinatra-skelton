#see https://coderwall.com/p/ellbgw/sinatra-authentication-with-warden

class AuthController < App::Base
  use Rack::Session::Cookie, secret: "IdoNotHaveAnySecret"
  #use Rack::Flash, accessorize: [:error, :success]

  use Warden::Manager do |config|
    # serialize user to session ->
    config.serialize_into_session do |user| 
      user[:name]
    end

    # serialize user from session <-
    config.serialize_from_session do |id| 
      { :name => id, :password => "test" }
    end

    # configuring strategies
    config.scope_defaults :default, 
                  strategies: [:password], 
                  action: '/unauthenticated'
    config.failure_app = self
  end

  Warden::Manager.before_failure do |env,opts|
     env['REQUEST_METHOD'] = 'POST'
   end

  Warden::Strategies.add(:password) do
    def valid?
      params["email"] && params["password"]
    end

    def authenticate!
      if params["email"] == "test" && params["password"] == "test"
        # ユーザー名とパスワードが正しければログイン成功
        user = {
          :name     => params["username"],
          :password => params["password"]
        }
        success!(user)
      else
        # ユーザー名とパスワードのどちらかでも間違っていたら
        # ログイン失敗
        fail!("Could not log in")
      end
    end
  end

  def warden_handler
    env['warden']
  end

  def current_user
    warden_handler.user
  end

  post '/join' do
    request.env["warden"].authenticate!
    redirect "/"
  end

  post '/unauthenticated' do
    redirect '/auth/login?auth=fail'
  end

  get '/login' do
    slim :login
  end
end
