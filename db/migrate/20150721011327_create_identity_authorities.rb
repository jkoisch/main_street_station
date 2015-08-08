class CreateIdentityAuthorities < ActiveRecord::Migration
  def change
    create_table :identity_authorities do |t|
      t.references  :user,                    null: false

      t.string      :provider,                null: false
      t.string      :uid,                     null: false
      #t.string      :token
      t.string      :token_secret
      t.string      :password,                default: ''
      t.string      :reset_password_token
      t.datetime    :reset_password_sent_at

      t.timestamps

      t.index :user_id
    end
  end
end
