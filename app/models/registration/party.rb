class Registration::Party < ActiveRecord::Base

  attr_accessible :community_role_id, :signature, :user_id, :address, :contract_id, :invitation_status

  belongs_to :community_role
  belongs_to :registration_contract, :class_name => 'Registration::Contract'

  has_one :directory_community_role, :class_name => 'Directory::CommunityRole'

end
