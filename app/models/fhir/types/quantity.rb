module Fhir
  module Types
    class Quantity < BaseType
      fhir_attribute :value
      fhir_attribute :comparator
      fhir_attribute :units
      fhir_attribute :system
      fhir_attribute :code
    end
  end
end
