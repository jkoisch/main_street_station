class CreateServices < ActiveRecord::Migration
  def up
    create_table :services do |t|
      t.integer :community_role_id
      t.text :name
      t.text :description
      t.text :address
      t.timestamps
    end
  end


  def down
    drop_table :services
  end
end
