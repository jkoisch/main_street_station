class AddInvitationStatusToParties < ActiveRecord::Migration
  def change
    add_column :parties, :invitation_status, :string
  end
end
