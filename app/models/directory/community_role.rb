class Directory::CommunityRole < ActiveRecord::Base
  belongs_to :community

  has_many :parties, dependent: :destroy, autosave: true
  has_many :services, dependent: :destroy, autosave: true


  accepts_nested_attributes_for :services, allow_destroy: true
  accepts_nested_attributes_for :parties, allow_destroy: true

  def as_json (options={})
    super(include: {services: {}})
  end


end
