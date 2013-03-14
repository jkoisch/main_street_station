class Registration::WhitelabelGroup < ActiveRecord::Base

  belongs_to :registration_whitelabel, :class_name => 'Registration::Whitelabel'
  belongs_to :directory_community, :class_name => 'Directory::Community'
end
