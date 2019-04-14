class CreateCommunityRoleKinds < ActiveRecord::Migration[5.0]
  def self.up
    create_table :community_role_kinds do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :community_role_kinds
  end
end
