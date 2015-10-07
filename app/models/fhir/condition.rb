module Fhir
  class Condition < BaseResource
    #attr_accessor :onset_date, :abatement_datetime, :abatement_boolean

    fhir_attribute :identifier, list: Fhir::Types::Identifier
    fhir_attribute :patient, type: Fhir::Types::Reference
    fhir_attribute :encounter, type: Fhir::Types::Reference
    fhir_attribute :asserter, type: Fhir::Types::Reference
    fhir_attribute :date_recorded
    fhir_attribute :code, type: Fhir::Types::CodeableConcept
    fhir_attribute :category, type: Fhir::Types::CodeableConcept
    fhir_attribute :clinical_status
    fhir_attribute :verification_status
    fhir_attribute :severity, type: Fhir::Types::CodeableConcept
    fhir_attribute :onset, type_list: [Types::SimpleDatetime, Types::Age, Types::Period,
                                       Types::Range, Types::SimpleString]
    fhir_attribute :abatement, type_list: [Types::SimpleDatetime, Types::Age, Types::SimpleBoolean,
                                           Types::Period, Types::Range, Types::SimpleString]
    fhir_attribute :stage, type: Fhir::ConditionClasses::Stage
    fhir_attribute :evidence, list: Fhir::ConditionClasses::Evidence
    fhir_attribute :body_site, list: Fhir::Types::CodeableConcept
    fhir_attribute :notes
  end
end
