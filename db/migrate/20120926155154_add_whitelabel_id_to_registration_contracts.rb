class AddWhitelabelIdToRegistrationContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :registration_contracts, :registration_whitelabel_id, :integer
  end
end
