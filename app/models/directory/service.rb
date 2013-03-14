class Directory::Service < ActiveRecord::Base
  attr_accessible :community_role_id, :name, :description, :youcentric_operations_attributes, :youcentric_objects_attributes

  belongs_to :community_role

  has_many :youcentric_operations, :dependent => :destroy, :autosave => true
  has_many :youcentric_objects, :dependent => :destroy, :autosave => true

  accepts_nested_attributes_for :youcentric_operations, :allow_destroy => true
  accepts_nested_attributes_for :youcentric_objects, :allow_destroy => true



  def as_json (options={})
    super(:include => {:youcentric_objects => {}, :youcentric_operations => {}})
  end
end
