object @contract
attributes :id, :registration_whitelabel_id, :community_id, :status, :constraint

child :registration_parties do
  attributes :id, :community_role_id, :user_id, :address, :invitation_status
end


