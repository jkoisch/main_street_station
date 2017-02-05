class CreateIdentityAuthorities < ActiveRecord::Migration
  def change
    create_table :identity_authorities do |t|
      t.references  :user,                    null: false

      t.string      :type
      t.string      :provider,                null: false
      t.string      :uid,                     null: false
      #t.string      :token
      t.string      :token_secret
      #t.string      :password
      t.string      :password_digest
      t.string      :reset_password_token
      t.datetime    :reset_password_sent_at
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps

      t.index :user_id
      t.index :confirmation_token
      t.index :reset_password_token
    end
  end
end
