require './apps/models/user'

class AuthController < App::Base
  post '/join' do
    @user = User.create(name: params['username'], email: params['email'], password: params['password'], password_confirmation: params['password'])
    if @user.invalid?
      @errors = @user.errors.messages
      return slim :login
    end

    redirect '/'
  end


  get '/login' do
    slim :login
  end
end
