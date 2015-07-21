require 'factory_girl'
require 'rspec'
require 'rack/test'
 
# データ定義ファイルの配置パスを設定し、定義させる。
FactoryGirl.definition_file_paths = %w{./factories ./test/factories ./spec/factories}
FactoryGirl.find_definitions
 
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods # specファイルの方でcreate(:item)のように呼び出せるようになるみたい
  config.before(:all) do
    # test用DBに接続
    ActiveRecord::Base.configurations = YAML.load_file('config/database.yml')
    ActiveRecord::Base.establish_connection('test')
  end
  config.after(:each) do
    ActiveRecord::Base.connection.close
  end
end
