ENV['RACK_ENV'] = 'test'
 
require "./spec/spec_helper"
require './apps/lib/app' # Sinatraに実行させるアプリケーションファイル
 
describe 'The HelloWorld App' do
  include Rack::Test::Methods
 
  def app
    Sinatra::Application
  end
 
  it "user" do
    @user = create(:user)
    @item.name.should == "item name"
  end
end

