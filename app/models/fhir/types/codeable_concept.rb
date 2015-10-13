module Fhir
  module Types
    class CodeableConcept < KeyedBaseType
      fhir_attribute :coding, list: Coding
      fhir_attribute :text
    end
  end
end