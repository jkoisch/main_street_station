class AddContractIdToParties < ActiveRecord::Migration
  def change
    add_column :registration_parties, :contract_id, :integer
  end
end
