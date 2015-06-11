require './apps/models/user'

class AuthController < App::Base
  post '/join' do
    @users = User.new(name: params['username'], email: params['email'], password: params['password'], password_confirmation: params['password'])
    @users.save
    if @users.invalid?
      flash[:error] = t.site.auth.join.validate.error
      @errors = flash
      return slim :login
    end
  end


  get '/login' do
    slim :login
  end
end
