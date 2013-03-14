class AddWhitelabelIdToRegistrationContracts < ActiveRecord::Migration
  def change
    add_column :registration_contracts, :registration_whitelabel_id, :integer
  end
end
