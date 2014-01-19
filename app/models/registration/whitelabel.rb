class Registration::Whitelabel < ActiveRecord::Base
  has_many :directory_communities, :class_name => 'Directory::Community', :through =>  :registration_whitelabel_groups

  has_many :registration_whitelabel_groups, :class_name => 'Registration::WhitelabelGroup', :dependent => :destroy, :autosave => true

  has_many :registration_contracts, :class_name => 'Registration::Contract', :dependent => :destroy, :autosave => true

  accepts_nested_attributes_for :registration_whitelabel_groups
end
