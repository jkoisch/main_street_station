class CreateCommunities < ActiveRecord::Migration
  def self.up
    create_table :communities do |t|
      t.text :name
      t.text :description
      t.text :objective
      t.timestamps
    end
  end

  def self.down
    drop_table :communities
  end
end
