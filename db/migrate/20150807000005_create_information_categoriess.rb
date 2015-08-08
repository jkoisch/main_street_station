class CreateInformationCategories < ActiveRecord::Migration
  def change
    create_table :information_categories do |t|
      t.timestamps
    end
  end
end