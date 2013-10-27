class AddAddressToParty < ActiveRecord::Migration
  def change
    add_column :registration_parties, :address, :string
  end
end
