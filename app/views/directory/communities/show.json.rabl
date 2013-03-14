object @community
attributes :id, :name, :description

child :community_roles do
  attributes :id, :name, :description, :role_kind

  child :services do
    attributes :id, :name, :description

    child :youcentric_operations do
      attributes :name, :description, :verb_id
    end

    child :youcentric_objects do
      attributes :name, :description, :script, :state_url, :youcentric_object_parent_id, :design_notes, :conformance_profile
    end
  end
end


