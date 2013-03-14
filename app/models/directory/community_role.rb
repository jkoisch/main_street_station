class Directory::CommunityRole < ActiveRecord::Base

  attr_accessible :name, :description, :community_id, :role_kind, :parties_attributes, :services_attributes

  belongs_to :community

  has_many :parties, :dependent => :destroy, :autosave => true
  has_many :services, :dependent => :destroy, :autosave => true


  accepts_nested_attributes_for :services, :allow_destroy => true
  accepts_nested_attributes_for :parties, :allow_destroy => true

  def as_json (options={})
    super(:include => {:services => {}})
  end


end
