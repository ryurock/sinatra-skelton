class HelloController < App::Base
  get '/' do
    #"Hello World hogehoge"
    slim :index
  end
end
