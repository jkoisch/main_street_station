module Fhir
  class OperationOutcome < BaseResource
    fhir_attribute :issue, list: OperationOutcomeClasses::Issue
  end
end