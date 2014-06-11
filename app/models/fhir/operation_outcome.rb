module Fhir
  class OperationOutcome < BaseResource
    fhir_attribute :issue, list: OperationOutcomeClasses::Issue

    def self.build(issue_attributes)
      new(issue: [ OperationOutcomeClasses::Issue.new(issue_attributes)])
    end
  end
end