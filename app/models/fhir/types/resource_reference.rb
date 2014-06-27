module Fhir
  module Types
    class ResourceReference < BaseType
      fhir_attribute :local_id
      fhir_attribute :local_type
      fhir_attribute :external_reference
    end
  end
end
