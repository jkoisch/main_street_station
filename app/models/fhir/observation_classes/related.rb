module Fhir
  module ObservationClasses
    class Related < BaseClass
      fhir_attribute :type
      fhir_attribute :target, type: Fhir::Types::Reference  #Observation
    end
  end
end