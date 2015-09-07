module Fhir
  class Observation < BaseResource
    attr_accessor :applies_date

    fhir_attribute :id
    fhir_attribute :code, type: Types::CodeableConcept
    fhir_attribute :value, type_list: [Types::Quantity, Types::CodeableConcept,
                                       Types::SimpleString, Types::Range, Types::Ratio,
                                      Types::SampledData, Types::Attachment,
                                       Types::SimpleTime, Types::SimpleDatetime,
                                      Types::Period]
    fhir_attribute :data_absent_reason, type: Types::CodeableConcept
    fhir_attribute :interpretation, type: Types::CodeableConcept
    fhir_attribute :comments
    fhir_attribute :applies, type_list: [Types::Period, Types::SimpleDatetime]
    fhir_attribute :issued
    fhir_attribute :status
    fhir_attribute :reliability
    fhir_attribute :body_site, type_list: [Types::CodeableConcept,Types::ResourceReference]
    fhir_attribute :method, type: Types::CodeableConcept
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :subject, type: Types::ResourceReference
    fhir_attribute :specimen, type: Types::ResourceReference
    fhir_attribute :performer, list: Types::ResourceReference
    fhir_attribute :device, type: Types::ResourceReference
    fhir_attribute :encounter, type: Types::ResourceReference
    fhir_attribute :reference_range, list: ObservationClasses::ReferenceRange
    fhir_attribute :related, list: ObservationClasses::Related
  end
end