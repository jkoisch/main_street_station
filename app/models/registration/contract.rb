class Registration::Contract < ActiveRecord::Base
  belongs_to :registration_whitelabel, :class_name => 'Registration::Whitelabel'

  has_many :registration_parties, :class_name => 'Registration::Party'

  accepts_nested_attributes_for :registration_parties
end
