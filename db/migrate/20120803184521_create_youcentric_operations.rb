class CreateYoucentricOperations < ActiveRecord::Migration
  def self.up
    create_table :youcentric_operations do |t|
      t.integer :service_id
      t.text :name
      t.text :description
      t.integer :verb_id
      t.timestamps
    end
  end

  def self.down
    drop_table :youcentric_operations
  end
end
