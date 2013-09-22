  child :name => :name do
    extends "fhir/observations/resource_content/codeable_concept"
  end

  child :value => :value do
    extends "fhir/observations/resource_content/component"
  end