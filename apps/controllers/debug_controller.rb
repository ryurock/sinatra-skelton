class DebugController < App::Base
  get '/' do
    'test'
  end
  get '/bootstrap-sample' do
    slim :debug_bootstrap_sample
  end
end
