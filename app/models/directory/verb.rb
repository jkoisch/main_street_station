class Directory::Verb < ActiveRecord::Base
  attr_accessible :name, :youcentric_interface_id

  belongs_to :youcentric_interface
end
