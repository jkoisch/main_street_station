class CreateRegistrationContracts < ActiveRecord::Migration
  def change
    create_table :registration_contracts do |t|
      t.integer :community_id
      t.string :status

      t.timestamps
    end
  end
end
