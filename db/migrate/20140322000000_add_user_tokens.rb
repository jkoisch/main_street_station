class AddUserTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tokens do |t|
      t.references :user, null: false
      t.string     :authentication_token, null: false
      t.string     :refresh_token, null: false
      t.datetime   :authentication_expiry, null: false
      t.datetime   :refresh_expiry, null: false

      t.timestamps

      t.index [:authentication_token], unique: true
      t.index [:refresh_token], unique: true
    end
  end
end
