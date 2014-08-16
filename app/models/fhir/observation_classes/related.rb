module Fhir
  module ObservationClasses
    class Related < BaseClass
      fhir_attribute :type
      fhir_attribute :target, type: Fhir::Types::ResourceReference  #Observation
    end
  end
end