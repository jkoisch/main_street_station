class CreateRegistrationParties < ActiveRecord::Migration
  def self.up
    create_table :registration_parties do |t|
      t.integer :community_role_id
      t.text :signature
      t.integer :user_id
      t.timestamps
      t.boolean :owner
    end
  end

  def self.down
    drop_table :parties
  end
end
