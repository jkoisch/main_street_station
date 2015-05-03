module Fhir
  module ConditionClasses
    class Location < BaseClass
      fhir_attribute :site, type_list: [Types::CodeableConcept, Types::ResourceReference]
      #fhir_attribute :site_codeable_concept, type: Fhir::Types::CodeableConcept
      #fhir_attribute :site_reference, type: Fhir::Types::ResourceReference
    end
  end
end