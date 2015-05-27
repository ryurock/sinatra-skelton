class DefaultController < App::Base
  get '/' do
    @hoge = 'fuga'
    slim :index
  end
end
