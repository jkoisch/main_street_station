class Directory::YoucentricObject < ActiveRecord::Base
  # script - identifies ruby script for database creation
  # conformance profile - fhir-based xml
  # youcentric_object_parent_id - id of youCentric_object that 'has' this as a child
  # state_url - for centrally managed resources, identifies the accessing url

  belongs_to :service
end
