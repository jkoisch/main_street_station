class ChangeColumnNameInRegistrationParty < ActiveRecord::Migration
  def change
    rename_column :registration_parties, :youCentricCenter_id, :user_id
  end
end
