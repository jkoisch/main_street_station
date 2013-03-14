class AddContraintsToContracts < ActiveRecord::Migration
  def change
    add_column :registration_contracts, :constraint, :string
  end
end
