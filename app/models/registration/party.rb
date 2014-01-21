class Registration::Party < ActiveRecord::Base
  belongs_to :community_role
  belongs_to :registration_contract, :class_name => 'Registration::Contract'

  has_one :directory_community_role, :class_name => 'Directory::CommunityRole'

end
