class Registration::Contract < ActiveRecord::Base
  attr_accessible :community_id, :status, :constraint, :registration_whitelabel_id, :registration_parties_attributes

  belongs_to :registration_whitelabel, :class_name => 'Registration::Whitelabel'

  has_many :registration_parties, :class_name => 'Registration::Party'

  accepts_nested_attributes_for :registration_parties
end
