class CreateVerbs < ActiveRecord::Migration[5.0]
  def self.up
    create_table :verbs do |t|
      t.text :name
      t.timestamps
    end
  end

  def self.down
    drop_table :verbs
  end
end
