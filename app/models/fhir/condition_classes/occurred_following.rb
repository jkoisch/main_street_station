module Fhir
  module ConditionClasses
    class OccurredFollowing < BaseClass
      fhir_attribute :code, type: Fhir::Types::CodeableConcept
      fhir_attribute :target, type: Fhir::Types::ResourceReference #Condition, Procedure, MedicationAdministration, Immunization, MedicationStatement
    end
  end
end