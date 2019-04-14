class CreateCommunityRoles < ActiveRecord::Migration[5.0]
  def self.up
    create_table :community_roles do |t|
      t.text :name
      t.text :description
      t.integer :community_id
      t.string :role_kind
      t.timestamps
    end
  end

  def self.down
    drop_table :community_roles
  end
end
