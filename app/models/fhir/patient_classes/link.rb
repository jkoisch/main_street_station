module Fhir
  module PatientClasses
    class Link < BaseClass
      # TODO: Add reference to Other: Resource(Patient)
      fhir_attribute :type
    end
  end
end