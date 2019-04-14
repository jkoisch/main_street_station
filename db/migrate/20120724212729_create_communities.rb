class CreateCommunities < ActiveRecord::Migration[5.0]
  def change
    create_table :communities do |t|
      t.text :name
      t.text :description
      t.text :objective

      t.timestamps
    end
  end
end