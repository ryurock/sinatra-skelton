class CreateAccessLogs < ActiveRecord::Migration
  def change
    create_table :access_logs do |t|
      t.string  :path
      t.integer :code, :null => false
      t.string  :user_agent
      t.string  :referer
      t.string  :ip_address
      t.timestamps
    end
  end
end
