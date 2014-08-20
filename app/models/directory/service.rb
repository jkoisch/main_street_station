class Directory::Service < ActiveRecord::Base
  belongs_to :community_role

  has_many :youcentric_operations, dependent: :destroy, autosave: true
  has_many :youcentric_objects, dependent: :destroy, autosave: true

  accepts_nested_attributes_for :youcentric_operations, allow_destroy: true
  accepts_nested_attributes_for :youcentric_objects, allow_destroy: true

  def as_json
    super(include: {youcentric_objects: {}, youcentric_operations: {}})
  end

  private

  def get_youcentric_object(id)
    youcentric_objects.find(id)
  end
end
