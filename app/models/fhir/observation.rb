module Fhir
  class Observation < BaseResource
    attr_accessor :applies_date

    fhir_attribute :id
    fhir_attribute :name, type: Types::CodeableConcept
    fhir_attribute :value, type_list: [Types::Quantity, Types::CodeableConcept, Types::SimpleString]
    #fhir_attribute :value_quantity, type: Types::Quantity
    #fhir_attribute :value_codeable_concept, type: Types::CodeableConcept
    fhir_attribute :value_attachment, type: Types::Attachment
    fhir_attribute :value_ratio, type: Types::Ratio
    fhir_attribute :value_date_time
    fhir_attribute :value_period, type: Types::Period
    fhir_attribute :value_sampled_data, type: Types::SampledData
    fhir_attribute :value_string
    fhir_attribute :value_time
    fhir_attribute :data_absent_reason
    fhir_attribute :interpretation, type: Types::CodeableConcept
    fhir_attribute :comments
    fhir_attribute :applies, type_list: [Types::Period, Types::SimpleDate]
    fhir_attribute :issued
    fhir_attribute :status
    fhir_attribute :reliability
    fhir_attribute :body_site, type: Types::CodeableConcept
    fhir_attribute :method, type: Types::CodeableConcept
    fhir_attribute :identifier, type: Types::Identifier
    fhir_attribute :subject, type: Types::ResourceReference #Patient|Group|Device|Location
    fhir_attribute :specimen, type: Types::ResourceReference #Specimen
    fhir_attribute :performer, list: Types::ResourceReference #Practitioner|Device|Organization
    fhir_attribute :encounter #, type: Types::Encounter
    fhir_attribute :reference_range, list: ObservationClasses::ReferenceRange
    fhir_attribute :related, list: ObservationClasses::Related
  end
end