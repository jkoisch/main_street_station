module Fhir
  module PatientClasses
    class Link < BaseClass
      fhir_attribute :other, type: Types::Reference #patient
      fhir_attribute :type
    end
  end
end