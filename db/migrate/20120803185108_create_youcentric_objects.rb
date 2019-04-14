class CreateYoucentricObjects < ActiveRecord::Migration[5.0]
  def self.up
    create_table :youcentric_objects do |t|
      t.integer :service_id
      t.text :name
      t.text :description
      t.text :script
      t.text :state_url
      t.integer :youcentric_object_parent_id
      t.text :design_notes
      t.text :conformance_profile
      t.timestamps
    end
  end

  def self.down
    drop_table :youcentric_objects
  end
end
