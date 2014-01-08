module Fhir
  module Types
    class Schedule < BaseType
      fhir_attribute :event, list: Fhir::Types::Period
      fhir_attribute :repeat, type: Fhir::Types::Repeat
    end
  end
end