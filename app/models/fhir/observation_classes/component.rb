module Fhir
  module ObservationClasses
    class Component < BaseClass
      fhir_attribute :code, type: Types::CodeableConcept
      fhir_attribute :value, type_list: [Types::Quantity, Types::CodeableConcept,
                                         Types::SimpleString, Types::Range,
                                         Types::Ratio, Types::SampledData,
                                         Types::Attachment, Types::SimpleTime,
                                         Types::SimpleDatetime, Types::Period]
      fhir_attribute :data_absent_reason, type: Types::CodeableConcept
      fhir_attribute :reference_range, list: ObservationClasses::ReferenceRange
    end
  end
end