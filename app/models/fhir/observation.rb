module Fhir
  class Observation < BaseResource
    attr_accessor :applies_date

    fhir_attribute :id
    fhir_attribute :code, type: Types::CodeableConcept
    fhir_attribute :value, type_list: [Types::Quantity, Types::CodeableConcept, Types::SimpleString]
    #fhir_attribute :value_quantity, type: Types::Quantity
    #fhir_attribute :value_codeable_concept, type: Types::CodeableConcept
    fhir_attribute :value_string
    fhir_attribute :value_range, type: Types::Range
    fhir_attribute :value_ratio, type: Types::Ratio
    fhir_attribute :value_sampled_data, type: Types::SampledData
    fhir_attribute :value_attachment, type: Types::Attachment
    fhir_attribute :value_time
    fhir_attribute :value_date_time
    fhir_attribute :value_period, type: Types::Period
    fhir_attribute :data_absent_reason, type: Types::CodeableConcept
    fhir_attribute :interpretation, type: Types::CodeableConcept
    fhir_attribute :comments
    fhir_attribute :applies, type_list: [Types::Period, Types::SimpleDate]
    fhir_attribute :issued
    fhir_attribute :status
    fhir_attribute :reliability
    fhir_attribute :body_site_codeable_concept, type: Types::CodeableConcept
    fhir_attribute :body_site_resource_reference, type: Types::ResourceReference
    fhir_attribute :method, type: Types::CodeableConcept
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :subject, type: Types::ResourceReference #Patient|Group|Device|Location
    fhir_attribute :specimen, type: Types::ResourceReference #Specimen
    fhir_attribute :performer, list: Types::ResourceReference #Practitioner|Device|Organization
    fhir_attribute :device, type: Types::ResourceReference #Device|DeviceMetric
    fhir_attribute :encounter, type: Types::ResourceReference #, type: Types::Encounter
    fhir_attribute :reference_range, list: ObservationClasses::ReferenceRange
    fhir_attribute :related, list: ObservationClasses::Related
  end
end