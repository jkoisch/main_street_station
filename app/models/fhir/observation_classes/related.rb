module Fhir
  module ObservationClasses
    class Related < BaseClass
      fhir_attribute :type
      # TODO: Reference for target: Resource(Observation) resource
    end
  end
end