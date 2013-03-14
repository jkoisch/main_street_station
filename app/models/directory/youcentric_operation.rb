class Directory::YoucentricOperation < ActiveRecord::Base
  attr_accessible :service_id, :name, :description, :verb_id

  belongs_to :service
end
