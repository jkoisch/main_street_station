class Directory::Verb < ActiveRecord::Base
  belongs_to :youcentric_interface
  scope :get_verb, where(:id => id)
end
