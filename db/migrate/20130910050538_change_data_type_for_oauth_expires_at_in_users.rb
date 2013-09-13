class ChangeDataTypeForOauthExpiresAtInUsers < ActiveRecord::Migration
  def up
    change_table :users do |u|
      u.change :oauth_expires_at, :date
    end
  end

  def down
    change_table :users do |u|
      u.change :oauth_expires_at
    end
  end
end
