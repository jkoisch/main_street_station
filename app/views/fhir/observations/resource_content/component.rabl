  child :name => :name do
    extends "fhir/observations/resource_content/codeable_concept"
  end

  child :valueQuantity => :valueQuantity do
    extends "fhir/observations/resource_content/quantity"
  end