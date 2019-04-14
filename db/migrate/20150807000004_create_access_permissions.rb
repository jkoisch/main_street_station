class CreateAccessPermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :access_permissions do |t|
      t.string     :access_name

      t.timestamps
    end
  end
end