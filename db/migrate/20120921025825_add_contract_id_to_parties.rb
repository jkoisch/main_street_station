class AddContractIdToParties < ActiveRecord::Migration
  def change
    add_column :parties, :contract_id, :integer
  end
end
