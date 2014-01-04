module Fhir
  module Types
    class Period < BaseType
      fhir_attribute :start
      fhir_attribute :end
    end
  end
end
