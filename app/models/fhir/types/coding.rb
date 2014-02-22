module Fhir
  module Types
    class Coding < KeyedBaseType
      fhir_attribute :system
      fhir_attribute :version
      fhir_attribute :code
      fhir_attribute :display
      fhir_attribute :primary
      # TODO: need to resolve value_set: Resource(ValueSet)
    end
  end
end
