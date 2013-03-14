class Registration::Whitelabel < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :contact_id, :contact_phone, :description, :email_primary, :name, :state, :work_phone, :zip_postal_code, :registration_whitelabel_groups_attributes, :registration_contracts_attributes


  has_many :directory_communities, :class_name => 'Directory::Community', :through =>  :registration_whitelabel_groups

  has_many :registration_whitelabel_groups, :class_name => 'Registration::WhitelabelGroup', :dependent => :destroy, :autosave => true

  has_many :registration_contracts, :class_name => 'Registration::Contract', :dependent => :destroy, :autosave => true

  accepts_nested_attributes_for :registration_whitelabel_groups
end
