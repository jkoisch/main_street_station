class Directory::Community < ActiveRecord::Base
  has_many :community_roles, :dependent => :destroy, :autosave => true
  has_many :registration_whitelabels, :class_name => 'Registration::Whitelabel', :through => :whitelabel_groups

  accepts_nested_attributes_for :community_roles, :allow_destroy => true

  def as_json (options={})
    super(:include => :community_roles)
  end

end
