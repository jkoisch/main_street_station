class CreateRegistrationWhitelabelGroups < ActiveRecord::Migration
  def change
    create_table :registration_whitelabel_groups do |t|
      t.integer :whitelabel_id
      t.integer :community_id

      t.timestamps
    end
  end
end
