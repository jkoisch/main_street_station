module Fhir
  module OperationOutcomeClasses
    class Issue < BaseClass
      fhir_attribute :severity
      fhir_attribute :type, type: Fhir::Types::Coding
      fhir_attribute :detail
      fhir_attribute :location
    end
  end
end