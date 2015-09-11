module Fhir
  module ConditionClasses
    class Location < BaseClass
      fhir_attribute :site, type_list: [Types::CodeableConcept, Types::ResourceReference]
    end
  end
end