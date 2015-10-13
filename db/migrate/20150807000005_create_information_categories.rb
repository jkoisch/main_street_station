class CreateInformationCategories < ActiveRecord::Migration
  def change
    create_table :information_categories do |t|
      t.string     :category_name

      t.timestamps
    end

    create_table :category_resource do |t|
      t.string    :resource
      t.string    :access
    end
  end
end