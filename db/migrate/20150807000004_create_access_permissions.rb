class CreateAccessPermissions < ActiveRecord::Migration
  def change
    create_table :access_permissions do |t|

      t.timestamps
    end
  end
end