class AddInvitationStatusToParties < ActiveRecord::Migration
  def change
    add_column :registration_parties, :invitation_status, :string
  end
end
