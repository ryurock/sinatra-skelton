class DefaultController < App::Base
  get '/' do
    @hoge = 'fuga'
    slim :index
    #if request.env["warden"].user.nil?
    #  slim :index
    #end
  end

  post '/unauthenticated' do
    redirect '/auth/login?auth=fail'
  end
end
