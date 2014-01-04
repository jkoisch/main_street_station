module Fhir
  module Types
    class CodeableConcept < BaseType
      fhir_attribute :coding, list: Coding
      fhir_attribute :text
    end
  end
end