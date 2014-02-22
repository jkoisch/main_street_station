module Fhir
  module Types
    class Schedule < BaseType
      fhir_attribute :event, list: Period
      fhir_attribute :repeat, type: Repeat
    end
  end
end