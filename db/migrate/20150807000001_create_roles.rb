class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :user

      t.timestamps
    end
  end
end