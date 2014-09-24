module Fhir
  module Types
    class Coding < KeyedBaseType
      fhir_attribute :system
      fhir_attribute :version
      fhir_attribute :code
      fhir_attribute :display
      fhir_attribute :primary
      fhir_attribute :value_set, type: Types::ResourceReference
    end
  end
end
